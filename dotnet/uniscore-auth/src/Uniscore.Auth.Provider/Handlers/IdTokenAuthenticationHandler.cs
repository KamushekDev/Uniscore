using System.Security.Claims;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Uniscore.Auth.Client;
using Uniscore.Auth.Provider.Identities;

namespace Uniscore.Auth.Provider.Handlers;

public class IdTokenAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
{
    private readonly IAuthGateway _gateway;
    private readonly ILogger<IdTokenAuthenticationHandler> _logger;

    public IdTokenAuthenticationHandler(
        IOptionsMonitor<AuthenticationSchemeOptions> options,
        ILoggerFactory logger,
        UrlEncoder encoder,
        ISystemClock clock,
        IAuthGateway gateway)
        : base(options, logger, encoder, clock)
    {
        _gateway = gateway;
        _logger = logger.CreateLogger<IdTokenAuthenticationHandler>();
    }


    protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
    {
        try
        {
            if (Request.Path == "/metrics")
                return AuthenticateResult.NoResult();
            
            if (!Request.Headers.TryGetValue(Schemes.AuthorizationHeaderName, out var token))
            {
                await ChallengeAsync(null);
                return AuthenticateResult.NoResult();
            }

            // todo: CancellationToken
            var response = await _gateway.GetUserIdFromToken(token, CancellationToken.None);

            // if (response is null)
            // {
            //     await ForbidAsync(null);
            //     return AuthenticateResult.Fail("Couldn't authenticate provided id token.");
            // }

            // todo: username 
            var userIdentity = new UserIdentity(Schemes.UniscoreScheme, true, response.UserId);

            var claims = new ClaimsPrincipal(userIdentity);

            var ticket = new AuthenticationTicket(claims, Schemes.UniscoreScheme);
            // await AuthenticateAsync();
            return AuthenticateResult.Success(ticket);
        }
        catch (Exception e)
        {
            _logger.LogDebug(e, "Couldn't authenticate id token");
            await ForbidAsync(null);
            return AuthenticateResult.Fail(e.Message);
        }
    }

    protected override Task HandleForbiddenAsync(AuthenticationProperties properties)
    {
        //Context.Response.ContentType = Context.Request.ContentType ?? "application/grpc";
        return base.HandleForbiddenAsync(properties);
    }

    protected override Task HandleChallengeAsync(AuthenticationProperties properties)
    {
        return base.HandleChallengeAsync(properties);
    }
}
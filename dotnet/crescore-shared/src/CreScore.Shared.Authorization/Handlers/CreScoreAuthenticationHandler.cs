using System.Security.Claims;
using System.Text.Encodings.Web;
using CreScore.Shared.Authorization.Gateways;
using CreScore.Shared.Authorization.Identities;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace CreScore.Shared.Authorization.Handlers;

public class CreScoreAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
{
    private readonly ICreScoreAuthGateway _gateway;

    public CreScoreAuthenticationHandler(
        IOptionsMonitor<AuthenticationSchemeOptions> options,
        ILoggerFactory logger,
        UrlEncoder encoder,
        ISystemClock clock,
        ICreScoreAuthGateway gateway)
        : base(options, logger, encoder, clock)
    {
        _gateway = gateway;
    }


    protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
    {
        if (!Request.Headers.TryGetValue(AuthConstants.AuthorizationHeaderName, out var token))
        {
            await ChallengeAsync(null);
            return AuthenticateResult.Fail("No id token was provided.");
        }

        // todo: CancellationToken
        var response = await _gateway.GetUserIdFromToken(token, CancellationToken.None);

        if (response is null)
        {
            await ForbidAsync(null); 
            return AuthenticateResult.Fail("Couldn't authenticate provided id token.");
        }

        // todo: username 
        var userIdentity = new UserIdentity(AuthConstants.CreScoreAuthScheme, true, "__username__", response);

        var claims = new ClaimsPrincipal(userIdentity);

        var ticket = new AuthenticationTicket(claims, AuthConstants.CreScoreAuthScheme);
        return AuthenticateResult.Success(ticket);
    }
}
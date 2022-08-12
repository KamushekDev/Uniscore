using Microsoft.Extensions.Logging;
using Uniscore.Auth.Api;
using Uniscore.Auth.Client.Models;

namespace Uniscore.Auth.Client.Gateway;

public class AuthGateway : IAuthGateway
{
    private readonly AuthorizationApi.AuthorizationApiClient _client;
    private readonly ILogger<AuthGateway> _logger;

    public AuthGateway(AuthorizationApi.AuthorizationApiClient client, ILogger<AuthGateway> logger)
    {
        _client = client;
        _logger = logger;
    }

    public async Task<Token> GetUserIdFromToken(string idToken, CancellationToken ct)
    {
        var request = new AuthRequest() { IdToken = idToken };
        var response = await _client.AuthorizeFirebaseTokenAsync(request, cancellationToken: ct);
        return new Token(response.UserId, response.Issuer, response.Subject, response.Audience, response.TenantId);
    }
}
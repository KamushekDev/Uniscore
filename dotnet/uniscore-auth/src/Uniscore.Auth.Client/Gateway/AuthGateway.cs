using Microsoft.Extensions.Logging;
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

    public async Task<User?> GetUser(string userId, CancellationToken ct)
    {
        try
        {
            var request = new GetFirebaseUserRequest()
            {
                UserId = userId
            };
            var response = await _client.GetFirebaseUserAsync(request);

            if (!response.Success)
                return null;

            var userInfo = response.UserInfo;

            var user = new User()
            {
                Disable = userInfo.Disable,
                DisplayName = userInfo.DisplayName,
                PhotoUrl = userInfo.PhotoUrl,
                ProviderId = userInfo.ProviderId,
                TenantId = userInfo.TenantId,
                UserId = userInfo.Uid,

                Email = userInfo.Email,
                EmailConfirmed = userInfo.EmailConfirmed,
                PhoneNumber = userInfo.PhoneNumber
            };
            return user;
        }
        catch (Exception e)
        {
            _logger.LogError(e, "{MethodName} was thrown an Exception", nameof(GetUser));
            return null;
        }
    }
}
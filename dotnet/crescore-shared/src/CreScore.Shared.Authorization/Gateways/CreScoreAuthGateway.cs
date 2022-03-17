using CreScore.Auth;

namespace CreScore.Shared.Authorization.Gateways;

public class CreScoreAuthGateway : ICreScoreAuthGateway
{
    private readonly AuthorizationApi.AuthorizationApiClient _client;

    public CreScoreAuthGateway(AuthorizationApi.AuthorizationApiClient client)
    {
        _client = client;
    }

    public async Task<string?> GetUserIdFromToken(string idToken, CancellationToken ct)
    {
        try
        {
            var request = new AuthRequest() { IdToken = idToken };
            var response = await _client.AuthorizeFirebaseTokenAsync(request, cancellationToken: ct);
            return response?.UserId;
        }
        catch
        {
            return null;
        }
    }
}
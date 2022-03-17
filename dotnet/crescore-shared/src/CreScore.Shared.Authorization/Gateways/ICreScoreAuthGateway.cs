namespace CreScore.Shared.Authorization.Gateways;

public interface ICreScoreAuthGateway
{
    Task<string?> GetUserIdFromToken(string idToken, CancellationToken ct);
}
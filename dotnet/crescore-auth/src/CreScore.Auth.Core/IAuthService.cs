namespace CreScore.Auth.Core;

public interface IAuthService
{
    Task<string?> GetUserIdByToken(string token, CancellationToken ct);
    Task<Models.UserInfo?> GetUserById(string userId, CancellationToken ct);
}
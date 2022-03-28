using CreScore.Auth.Core.Models;

namespace CreScore.Auth.Core;

public interface IAuthService
{
    Task<TokenInfo> GetUserIdByToken(string token, CancellationToken ct);
    Task<UserInfo> GetUserById(string userId, CancellationToken ct);
}
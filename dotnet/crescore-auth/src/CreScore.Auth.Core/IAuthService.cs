using CreScore.Auth.Core.Models;

namespace CreScore.Auth.Core;

public interface IAuthService
{
    Task<string?> GetUserIdByToken(string token, CancellationToken ct);
    Task<Core.Models.UserInfo?> GetUserById(string userId, CancellationToken ct);
}
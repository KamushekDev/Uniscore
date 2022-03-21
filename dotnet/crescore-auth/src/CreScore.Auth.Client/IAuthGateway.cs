using CreScore.Auth.Client.Models;

namespace CreScore.Auth.Client;

public interface IAuthGateway
{
    Task<string?> GetUserIdFromToken(string idToken, CancellationToken ct);

    Task<User?> GetUser(string userId, CancellationToken ct);
}
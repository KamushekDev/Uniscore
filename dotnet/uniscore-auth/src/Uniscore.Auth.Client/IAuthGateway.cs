using Uniscore.Auth.Client.Models;

namespace Uniscore.Auth.Client;

public interface IAuthGateway
{
    Task<Token> GetUserIdFromToken(string idToken, CancellationToken ct);
}
namespace Uniscore.Shared.Auth.AuthStore;

public interface IAuthStore
{
    bool IsTokenSet { get; }
    string? GetToken();
    bool SetAuthorization(string? token);
}
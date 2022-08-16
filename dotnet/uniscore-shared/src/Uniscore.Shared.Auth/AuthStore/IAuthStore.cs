namespace Uniscore.Shared.Auth.AuthStore;

public interface IAuthStore
{
    bool IsTokenSet { get; }
    string? GetToken();
    void SetAuthorization(string token);
}
namespace Uniscore.Auth.Provider.AuthStore;

public interface IAuthStore
{
    bool IsTokenSet { get; }
    string? GetToken();
    void SetAuthorization(string token);
}
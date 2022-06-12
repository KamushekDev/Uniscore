namespace Uniscore.Auth.Provider;

public interface ITokenStore
{
    bool IsTokenSet { get; }
    string? GetToken();
    void SetToken(string token);
}
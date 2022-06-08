namespace CreScore.Shared.Authorization;

public interface ITokenStore
{
    bool IsTokenSet { get; }
    string? GetToken();
    void SetToken(string token);
}
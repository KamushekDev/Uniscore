namespace CreScore.Auth.Helper;

public interface ITokenStore
{
    bool IsTokenSet { get; }
    string? GetToken();

    /// <summary>
    /// Returns true, if token value was changed.
    /// </summary>
    bool SetToken(string token);
}
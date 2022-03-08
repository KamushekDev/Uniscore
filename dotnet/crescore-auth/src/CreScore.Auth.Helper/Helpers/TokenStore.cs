namespace CreScore.Auth.Helper.Helpers;

public class TokenStore : ITokenStore
{
    private string? _token;

    public bool IsTokenSet => _token != null;

    public string? GetToken()
    {
        return _token;
    }

    /// <summary>
    /// Returns true, if token value was changed.
    /// </summary>
    public bool SetToken(string token)
    {
        if (token == null) throw new ArgumentNullException(nameof(token));

        var origin = Interlocked.Exchange(ref _token, token);

        return origin != token;
    }
}
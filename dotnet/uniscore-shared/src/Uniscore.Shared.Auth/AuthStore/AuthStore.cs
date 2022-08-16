namespace Uniscore.Shared.Auth.AuthStore;

internal class AuthStore : IAuthStore
{
    private string? _token;

    public bool IsTokenSet => _token != null;

    public string? GetToken()
    {
        return _token;
    }

    public void SetAuthorization(string token)
    {
        if (_token is not null)
            throw new InvalidOperationException("Token is already set.");
        
        _token = token ?? throw new ArgumentNullException();
    }
}
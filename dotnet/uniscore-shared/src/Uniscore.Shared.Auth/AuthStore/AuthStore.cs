using System.Diagnostics.CodeAnalysis;

namespace Uniscore.Shared.Auth.AuthStore;

internal class AuthStore : IAuthStore
{
    private string? _token;

    public bool IsTokenSet => _token != null;

    [MemberNotNullWhen(true, nameof(IsTokenSet))]
    public string? GetToken()
    {
        return _token;
    }

    public bool SetAuthorization(string? token)
    {
        var result = _token == token;
        _token = token;

        return result;
    }
}
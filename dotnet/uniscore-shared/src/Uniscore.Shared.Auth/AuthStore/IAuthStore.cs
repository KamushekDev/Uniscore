using System.Diagnostics.CodeAnalysis;

namespace Uniscore.Shared.Auth.AuthStore;

public interface IAuthStore
{
    bool IsTokenSet { get; }

    [MemberNotNullWhen(true, nameof(IsTokenSet))]
    string? GetToken();

    bool SetAuthorization(string? token);
}
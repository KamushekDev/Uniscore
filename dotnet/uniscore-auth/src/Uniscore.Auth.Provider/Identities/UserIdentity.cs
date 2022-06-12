using System.Security.Principal;

namespace Uniscore.Auth.Provider.Identities;

public class UserIdentity : IIdentity
{
    public UserIdentity(string? authenticationType, bool isAuthenticated, string userId)
    {
        AuthenticationType = authenticationType;
        IsAuthenticated = isAuthenticated;
        Name = userId;
    }

    public string? AuthenticationType { get; }
    public bool IsAuthenticated { get; }
    public string Name { get; }
    public string UserId => Name;
}
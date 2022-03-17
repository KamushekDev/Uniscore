using System.Security.Principal;

namespace CreScore.Shared.Authorization.Identities;

public class UserIdentity : IIdentity
{
    public UserIdentity(string? authenticationType, bool isAuthenticated, string name, string userId)
    {
        AuthenticationType = authenticationType;
        IsAuthenticated = isAuthenticated;
        Name = name;
        UserId = userId;
    }

    public string? AuthenticationType { get; }
    public bool IsAuthenticated { get; }
    public string Name { get; }
    public string UserId { get; }
}
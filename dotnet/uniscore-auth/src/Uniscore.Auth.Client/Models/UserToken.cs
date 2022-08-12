namespace Uniscore.Auth.Client.Models;

public class UserToken
{
    public string UserId { get; init; }
    public string DisplayName { get; init; }
    public string PhotoUrl { get; init; }
    public bool Disable { get; init; }
    public string TenantId { get; init; }
    public string ProviderId { get; init; }
    public string Email { get; init; }
    public bool EmailConfirmed { get; init; }
    public string PhoneNumber { get; init; }
}
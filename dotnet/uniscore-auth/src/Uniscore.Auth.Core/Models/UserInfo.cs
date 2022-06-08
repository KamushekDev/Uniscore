namespace Uniscore.Auth.Core.Models;

public record UserInfo(
    string Uid,
    string DisplayName,
    string PhotoUrl,
    bool Disabled,
    string TenantId,
    ContactInfo ContactInfo,
    string ProviderId
);

public record ContactInfo(
    string Email,
    bool EmailVerified,
    string PhoneNumber
);
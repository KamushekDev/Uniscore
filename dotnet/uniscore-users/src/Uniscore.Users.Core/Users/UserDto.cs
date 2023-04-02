namespace Uniscore.Users.Core.Users;

public record UserDto(
    string Id,
    string? Email,
    string? PhoneNumber,
    bool EmailVerified,
    string? DisplayName,
    string? PhotoUrl,
    bool Disabled,
    DateTime? CreatedAt
    // metadata
    // customClaims
);
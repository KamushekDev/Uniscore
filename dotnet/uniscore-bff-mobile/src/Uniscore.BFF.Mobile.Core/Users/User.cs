namespace Uniscore.BFF.Mobile.Core.Users;

public record User(
    string Id,
    string? Email,
    bool EmailVerified,
    string? PhoneNumber,
    string? DisplayName,
    string? PhotoUrl,
    bool Disabled,
    DateTime? CreatedAt
);
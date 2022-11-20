namespace Uniscore.Users.Contract;

public sealed record UserModel(
    string Id,
    string? Email,
    bool EmailVerified,
    string? PhoneNumber,
    string? DisplayName,
    string? PhotoUrl,
    bool Disabled,
    DateTime? CreatedAt
);
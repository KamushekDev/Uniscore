namespace Uniscore.Users.Contract;

public record User(
    string Id,
    string DisplayName,
    string Email,
    string PhoneNumber,
    string PhotoUrl
);
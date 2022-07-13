namespace Uniscore.Auth.Contract.Users;

public record User(
    string Id,
    string DisplayName,
    string Email,
    string PhoneNumber,
    string PhotoUrl
);
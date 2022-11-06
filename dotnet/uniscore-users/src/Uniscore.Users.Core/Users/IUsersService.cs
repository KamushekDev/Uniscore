namespace Uniscore.Users.Core.Users;

public interface IUsersService
{
    Task<UserDto> GetUser(string userId, string currentUserId, CancellationToken token);
}
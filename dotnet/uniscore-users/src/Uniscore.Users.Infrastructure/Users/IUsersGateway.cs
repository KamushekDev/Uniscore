using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Infrastructure.Users;

public interface IUsersGateway
{
    Task<UserDto> GetUser(string userId, CancellationToken token);
}
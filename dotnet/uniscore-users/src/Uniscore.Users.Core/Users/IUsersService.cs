using Uniscore.Users.Contract;

namespace Uniscore.Users.Core.Users;

public interface IUsersService
{
    Task<User> GetUser(string userId);
}
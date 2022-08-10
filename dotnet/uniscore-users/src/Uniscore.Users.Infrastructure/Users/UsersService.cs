using Uniscore.Users.Contract;
using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersService : IUsersService
{
    public Task<User> GetUser(string userId)
    {
        return Task.FromResult(
            new User(
                "user_id",
                "user_displayName",
                "user_email",
                "user_phoneNumber",
                "user_photoUrl")
        );
    }
}
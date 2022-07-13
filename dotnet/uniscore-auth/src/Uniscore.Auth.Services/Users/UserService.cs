using Uniscore.Auth.Contract.Users;
using Uniscore.Auth.Core.Users;

namespace Uniscore.Auth.Services.Users;

public class UserService : IUserService
{
    public Task<User> GetUser(string userId)
    {
        return Task.FromResult(new User("id", "name", "email", "phone", "photo"));
    }
}
using Uniscore.Auth.Contract.Users;

namespace Uniscore.Auth.Core.Users;

public interface IUserService
{
    Task<User> GetUser(string userId);
}
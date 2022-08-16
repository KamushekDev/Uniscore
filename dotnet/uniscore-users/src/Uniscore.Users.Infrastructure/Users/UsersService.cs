using Uniscore.Users.Contract;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Mappings;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersService : IUsersService
{
    private readonly IUsersGateway _gateway;

    public UsersService(IUsersGateway gateway)
    {
        _gateway = gateway;
    }

    public async Task<User> GetUser(string userId)
    {
        var user = await _gateway.GetUser(userId);

        var result = Mapper.MapTo_User(user);

        return result;
    }
}
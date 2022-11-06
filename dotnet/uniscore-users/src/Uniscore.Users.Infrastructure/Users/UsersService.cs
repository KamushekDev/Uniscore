using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersService : IUsersService
{
    private readonly IUsersGateway _gateway;

    public UsersService(IUsersGateway gateway)
    {
        _gateway = gateway;
    }

    public async Task<UserDto> GetUser(string userId, string currentUserId, CancellationToken token)
    {
        return await _gateway.GetUser(userId, token);
    }
}
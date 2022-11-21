using CSharpFunctionalExtensions;
using Uniscore.BFF.Mobile.Core.Users;
using Uniscore.Users.Client;

namespace Uniscore.BFF.Mobile.Infrastructure.Users;

public class UserService : IUserService
{
    private readonly IUserApiClient _client;

    public UserService(IUserApiClient client)
    {
        _client = client;
    }

    public async Task<Result<User>> GetUser(string userId, CancellationToken token)
    {
        var result = await _client.GetUser(userId, token);

        return result
            .Map(UserMapper.MapToUser);
    }
}
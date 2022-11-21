using CSharpFunctionalExtensions;
using Grpc.Core;
using Uniscore.Users.Api;
using Uniscore.Users.Contract;

namespace Uniscore.Users.Client;

public class UserApiClient : IUserApiClient
{
    private readonly UsersApi.UsersApiClient _client;

    public UserApiClient(UsersApi.UsersApiClient client)
    {
        _client = client;
    }

    public async Task<Result<UserModel>> GetUser(string userId, CancellationToken token)
    {
        try
        {
            var request = new GetUserRequest
            {
                UserId = userId
            };

            var response = await _client.GetUserAsync(request, cancellationToken: token);

            return Mappers.UserMapper.MapToUserModel(response);
        }
        catch (RpcException ex) when (ex.StatusCode is StatusCode.NotFound)
        {
            return Result.Failure<UserModel>($"Couldn't find user with userid='{userId}'");
        }
    }
}
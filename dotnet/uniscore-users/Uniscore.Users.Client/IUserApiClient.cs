using CSharpFunctionalExtensions;
using Uniscore.Users.Contract;

namespace Uniscore.Users.Client;

public interface IUserApiClient
{
    Task<Result<UserModel>> GetUser(string userId, CancellationToken token);
}
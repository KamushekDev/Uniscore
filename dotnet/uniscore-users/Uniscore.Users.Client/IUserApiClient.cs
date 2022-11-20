using CSharpFunctionalExtensions;
using Uniscore.Users.Client.Errors;
using Uniscore.Users.Contract;

namespace Uniscore.Users.Client;

public interface IUserApiClient
{
    Task<Result<UserModel, GetUserError>> GetUser(string userId, CancellationToken token);
}
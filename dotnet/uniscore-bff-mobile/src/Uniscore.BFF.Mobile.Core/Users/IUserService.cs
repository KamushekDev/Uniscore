using CSharpFunctionalExtensions;

namespace Uniscore.BFF.Mobile.Core.Users;

public interface IUserService
{
      public Task<Result<User>> GetUser(string userId, CancellationToken token);
}
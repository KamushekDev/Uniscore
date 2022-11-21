using CSharpFunctionalExtensions;
using Uniscore.BFF.Mobile.Core.Profiles;
using Uniscore.BFF.Mobile.Core.Users;

namespace Uniscore.BFF.Mobile.Infrastructure.Profiles;

public class ProfileService : IProfileService
{
    private readonly IUserService _userService;

    public ProfileService(IUserService userService)
    {
        _userService = userService;
    }

    public async Task<Result<Core.Profiles.Profile>> GetProfile(string userId, CancellationToken token)
    {
        var userTask = _userService.GetUser(userId, token);

        await Task.WhenAll(new[] { userTask });

        var userResult = await userTask;

        var aggregatedResult = Result.FirstFailureOrSuccess(userResult);

        if (aggregatedResult.IsFailure)
        {
            return Result.Failure<Core.Profiles.Profile>(aggregatedResult.Error);
        }

        return ProfileMapper.MapToProfile(userResult.Value);
    }
}
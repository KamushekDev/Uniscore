using Grpc.Core;
using Uniscore.BFF.Mobile.Core.Profiles;
using Uniscore.BFF.Mobile.Profile.Grpc;
using Uniscore.Shared.Auth.AuthStore;

namespace Uniscore.BFF.Mobile.Grpc;

public class ProfileApiService : ProfileApi.ProfileApiBase
{
    private readonly IProfileService _profileService;
    private readonly IAuthStore _store;

    public ProfileApiService(IProfileService profileService, IAuthStore store)
    {
        _profileService = profileService;
        _store = store;
    }

    public override async Task<Profile.Grpc.GetUserProfileResponse> GetUserProfile(
        Profile.Grpc.GetUserProfileRequest request, ServerCallContext context)
    {
        var result = await _profileService.GetProfile(request.UserId, context.CancellationToken);

        if (result.TryGetValue(out var profile))
        {
            return new Profile.Grpc.GetUserProfileResponse()
            {
                UserId = profile.User.Id,
                DisplayName = profile.User.DisplayName,
                PhotoUrl = profile.User.PhotoUrl,
                Disabled = profile.User.Disabled
            };
        }
        
        // todo: доменные ошибки
        throw new RpcException(new Status(StatusCode.Internal, result.Error), result.Error);
    }
}
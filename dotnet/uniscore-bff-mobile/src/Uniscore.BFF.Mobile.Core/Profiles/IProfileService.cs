using CSharpFunctionalExtensions;

namespace Uniscore.BFF.Mobile.Core.Profiles;

public interface IProfileService
{
    public Task<Result<Profile>> GetProfile(string userId, CancellationToken token);
}
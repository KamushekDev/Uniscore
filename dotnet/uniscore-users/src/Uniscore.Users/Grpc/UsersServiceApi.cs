using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Uniscore.Shared.Auth.ContextMetadata;
using Uniscore.Users.Api;
using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Grpc;

[Authorize]
public class UsersServiceApi : UsersApi.UsersApiBase
{
    private readonly IUsersService _usersService;
    private readonly IContextMetadataExtractor _extractor;

    public UsersServiceApi(IUsersService usersService, IContextMetadataExtractor extractor)
    {
        _usersService = usersService;
        _extractor = extractor;
    }

    public override async Task<GetUserResponse> GetUser(GetUserRequest request, ServerCallContext context)
    {
        var currentUserId = _extractor.GetUserId(context.GetHttpContext().User);

        var shortUser = await _usersService.GetUser(request.UserId, currentUserId, context.CancellationToken);


        var response = MapResponse(shortUser);
        return response;

        GetUserResponse MapResponse(UserDto user)
        {
            return new GetUserResponse()
            {
                Id = user.Id,
                Disabled = user.Disabled,
                Email = user.Email,
                EmailVerified = user.EmailVerified,
                DisplayName = user.DisplayName,
                PhoneNumber = user.PhoneNumber,
                PhotoUrl = user.PhotoUrl
            };
        }
    }
}
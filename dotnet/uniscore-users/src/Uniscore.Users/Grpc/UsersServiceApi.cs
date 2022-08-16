using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Uniscore.Shared.Auth;
using Uniscore.Shared.Auth.ContextMetadata;
using Uniscore.Users.Api;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Mappings;

namespace Uniscore.Users.Grpc;

public class UsersServiceApi : UsersApi.UsersApiBase
{
    private readonly IUsersService _usersService;
    private readonly IContextMetadataExtractor _extractor;

    public UsersServiceApi(IUsersService usersService, IContextMetadataExtractor extractor)
    {
        _usersService = usersService;
        _extractor = extractor;
    }

    [Authorize(Policies.ValidUser)]
    public override async Task<GetCurrentUserResponse> GetCurrentUser(GetCurrentUserRequest request,
        ServerCallContext context)
    {
        var userId = _extractor.GetUserId(context.GetHttpContext().User);

        var user = await _usersService.GetUser(userId);

        var response = Mapper.MapTo_GetCurrentUserResponse(user);

        return response;
    }

    public override async Task<GetUserResponse> GetUser(GetUserRequest request, ServerCallContext context)
    {
        var user = await _usersService.GetUser(request.UserId);

        var response = Mapper.MapTo_GetUserResponse(user);

        return response;
    }
}
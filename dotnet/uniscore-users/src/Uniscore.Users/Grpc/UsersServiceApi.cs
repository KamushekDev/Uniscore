using Grpc.Core;
using Uniscore.Users.Api;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Mappings;

namespace Uniscore.Users.Grpc;

public class UsersServiceApi : UsersApi.UsersApiBase
{
    private readonly IUsersService _usersService;

    public UsersServiceApi(IUsersService usersService)
    {
        _usersService = usersService;
    }

    public override async Task<GetCurrentUserResponse> GetCurrentUser(GetCurrentUserRequest request,
        ServerCallContext context)
    {
        // todo: get current user id from context
        var currentUserId = "test";
        
        var user = await _usersService.GetUser(currentUserId);

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
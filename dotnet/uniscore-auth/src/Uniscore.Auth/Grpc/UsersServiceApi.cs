using Grpc.Core;
using Mapster;
using MapsterMapper;
using Uniscore.Auth.Core.Users;
using Uniscore.Auth.Infrastructure.Mappings;
using Uniscore.Auth.Users;

namespace Uniscore.Auth.Grpc;

public class UsersServiceApi : UsersApi.UsersApiBase
{
    private readonly IUserService _userService;

    private readonly IMapper _mapper;
    // private readonly IUsersMapper _mapper;

    public UsersServiceApi(IUserService userService, IMapper mapper)
    {
        _userService = userService;
        _mapper = mapper;
        // _mapper = mapper;
    }

    public override async Task<GetUserResponse> GetUser(GetUserRequest request, ServerCallContext context)
    {
        var user = await _userService.GetUser(request.UserId);

        var response = new GetUserResponse()
        {
            User = _mapper.Map<UserMessage>(user)
        };
        return response;
    }

    public override Task<GetCurrentUserResponse> GetCurrentUser(GetCurrentUserRequest request,
        ServerCallContext context)
    {
        return base.GetCurrentUser(request, context);
    }
}
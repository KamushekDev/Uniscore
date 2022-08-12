using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Grpc.Core;
using Uniscore.Users.Contract;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Mappings;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersService : IUsersService
{
    private readonly FirebaseAuth _auth;

    public UsersService(FirebaseApp app)
    {
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<User> GetUser(string userId)
    {
        try
        {
            var user = await _auth.GetUserAsync(userId);

            var result = Mapper.MapTo_User(user);

            return result;
        }
        catch (FirebaseAuthException authException) when (authException.AuthErrorCode == AuthErrorCode.UserNotFound)
        {
            throw new RpcException(new Status(StatusCode.NotFound, authException.Message));
        }
    }
}
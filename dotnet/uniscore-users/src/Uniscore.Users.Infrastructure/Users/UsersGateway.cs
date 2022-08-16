using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Grpc.Core;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersGateway : IUsersGateway
{
    private readonly FirebaseAuth _auth;


    public UsersGateway(FirebaseApp app)
    {
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<UserRecord> GetUser(string userId)
    {
        try
        {
            return await _auth.GetUserAsync(userId);
        }
        // todo: нужно сделать доменные исключения, которые интерсептором будут мапиться в правильные коды
        catch (FirebaseAuthException authException) when (authException.AuthErrorCode == AuthErrorCode.UserNotFound)
        {
            throw new RpcException(new Status(StatusCode.NotFound, authException.Message));
        }
    }
}
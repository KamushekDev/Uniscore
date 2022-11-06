using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Grpc.Core;
using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Infrastructure.Users;

public class UsersGateway : IUsersGateway
{
    private readonly FirebaseAuth _auth;


    public UsersGateway(FirebaseApp app)
    {
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<UserDto> GetUser(string userId, CancellationToken token)
    {
        try
        {
            var response = await _auth.GetUserAsync(userId, token);

            return MapUser(response);
        }
        // todo: нужно сделать доменные исключения, которые интерсептором будут мапиться в правильные коды
        catch (FirebaseAuthException authException) when (authException.AuthErrorCode == AuthErrorCode.UserNotFound)
        {
            throw new RpcException(new Status(StatusCode.NotFound, authException.Message));
        }

        UserDto MapUser(UserRecord user)
        {
            var result = new UserDto(
                user.Uid,
                user.Email,
                user.PhoneNumber,
                user.EmailVerified,
                user.DisplayName,
                user.PhotoUrl,
                user.Disabled
            );
            return result;
        }
    }
}
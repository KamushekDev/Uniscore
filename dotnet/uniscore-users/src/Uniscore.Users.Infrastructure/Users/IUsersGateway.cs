using FirebaseAdmin.Auth;

namespace Uniscore.Users.Infrastructure.Users;

public interface IUsersGateway
{
    Task<UserRecord> GetUser(string userId);
}
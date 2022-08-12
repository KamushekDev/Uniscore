using FirebaseAdmin.Auth;
using Uniscore.Users.Api;
using Uniscore.Users.Contract;

namespace Uniscore.Users.Infrastructure.Mappings;

// удалить эту хуету позорную
public class Mapper
{
    public static GetUserResponse MapTo_GetUserResponse(User user)
    {
        return new GetUserResponse()
        {
            User = new UserMessage()
            {
                UserId = user.Id,
                Email = user.Email,
                DisplayName = user.DisplayName,
                PhoneNumber = user.PhoneNumber,
                PhotoUrl = user.PhotoUrl
            }
        };
    }

    public static GetCurrentUserResponse MapTo_GetCurrentUserResponse(User user)
    {
        return new GetCurrentUserResponse()
        {
            User = new UserMessage()
            {
                UserId = user.Id,
                Email = user.Email,
                DisplayName = user.DisplayName,
                PhoneNumber = user.PhoneNumber,
                PhotoUrl = user.PhotoUrl
            }
        };
    }

    public static User MapTo_User(UserRecord user)
    {
        return new User(
            user.Uid,
            user.DisplayName,
            user.Email,
            user.PhoneNumber,
            user.PhotoUrl
        );
    }
}
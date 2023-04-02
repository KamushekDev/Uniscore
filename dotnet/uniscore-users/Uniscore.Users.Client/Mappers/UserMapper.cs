using Riok.Mapperly.Abstractions;
using Uniscore.Users.Api;
using Uniscore.Users.Contract;

namespace Uniscore.Users.Client.Mappers;

[Mapper]
public static partial class UserMapper
{
    public static partial UserModel MapToUserModel(GetUserResponse userResponse);

    public static DateTime? MapToDateTime(TimestampValue timestampValue)
    {
        return timestampValue.TimestampCase switch {
            TimestampValue.TimestampOneofCase.TimestampValue_ => timestampValue.TimestampValue_.ToDateTime(),
            TimestampValue.TimestampOneofCase.TimestampIsNull => null,
            _ => throw new ArgumentOutOfRangeException()
        };
    }
}
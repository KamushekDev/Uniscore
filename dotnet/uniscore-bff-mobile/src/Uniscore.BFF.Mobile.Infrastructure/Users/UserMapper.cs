using Riok.Mapperly.Abstractions;
using Uniscore.BFF.Mobile.Core.Users;
using Uniscore.Users.Contract;

namespace Uniscore.BFF.Mobile.Infrastructure.Users;

[Mapper(EnumMappingStrategy = EnumMappingStrategy.ByName, EnumMappingIgnoreCase = true)]
public static partial class UserMapper
{
    public static partial User MapToUser(UserModel model);
}
using Riok.Mapperly.Abstractions;
using Uniscore.BFF.Mobile.Core.Users;

namespace Uniscore.BFF.Mobile.Infrastructure.Profiles;

[Mapper(EnumMappingStrategy = EnumMappingStrategy.ByName, EnumMappingIgnoreCase = true)]
public static partial class ProfileMapper
{
    public static partial Core.Profiles.Profile MapToProfile(User user);
}
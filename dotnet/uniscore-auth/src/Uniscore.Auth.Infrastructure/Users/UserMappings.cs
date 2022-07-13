using Mapster;
using Uniscore.Auth.Contract.Users;
using Uniscore.Auth.Users;

namespace Uniscore.Auth.Infrastructure.Users;

public class UserMappings : IRegister
{
    public void Register(TypeAdapterConfig config)
    {
        config.NewConfig<User, UserMessage>()
            .Map(d => d.UserId, src => src.Id)
            .Map(d => d.Email, src => src.Email)
            .Map(d => d.DisplayName, src => src.DisplayName)
            .Map(d => d.PhoneNumber, src => src.PhoneNumber)
            .Map(d => d.PhotoUrl, src => src.PhotoUrl)
            .GenerateMapper(MapType.Map);
    }
}
using Mapster;
using Uniscore.Auth.Contract.Users;
using Uniscore.Auth.Users;

namespace Uniscore.Auth.Infrastructure.Mappings;

[Mapper]
public interface IUsersMapper
{
    UserMessage MapTo(User user);
    
}
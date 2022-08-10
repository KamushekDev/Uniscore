using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Users;

namespace Uniscore.Users.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IUsersService, UsersService>();
        
        return sc;
    }
}
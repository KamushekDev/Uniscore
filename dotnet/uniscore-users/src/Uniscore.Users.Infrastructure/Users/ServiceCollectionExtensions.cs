using Microsoft.Extensions.DependencyInjection;
using Uniscore.Users.Core.Users;

namespace Uniscore.Users.Infrastructure.Users;

public static class ServiceCollectionExtensions
{
    public static void AddUsers(this IServiceCollection sc)
    {
        sc.AddTransient<IUsersGateway, UsersGateway>();
        sc.AddTransient<IUsersService, UsersService>();
    }
}
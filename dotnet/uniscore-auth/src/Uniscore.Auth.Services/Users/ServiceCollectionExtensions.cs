using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Core.Users;

namespace Uniscore.Auth.Services.Users;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddUserServices(this IServiceCollection sc)
    {
        sc.AddTransient<IUserService, UserService>();

        return sc;
    }
}
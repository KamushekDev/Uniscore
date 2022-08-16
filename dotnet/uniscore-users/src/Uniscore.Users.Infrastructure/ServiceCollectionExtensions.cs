using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Shared.Auth.Extensions;
using Uniscore.Shared.Auth.Options;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Firebase;
using Uniscore.Users.Infrastructure.Users;

namespace Uniscore.Users.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc,
        IConfiguration configuration,
        IWebHostEnvironment environment)
    {
        sc.AddUniscoreHealthChecks();

        sc.AddAuth(configuration, environment);

        sc.AddUniscoreGrpc(_ => { });

        sc.AddFirebase(configuration);

        sc.AddTransient<IUsersService, UsersService>();

        return sc;
    }

    private static void AddAuth(this IServiceCollection sc, IConfiguration configuration,
        IWebHostEnvironment environment)
    {
        var options = new UniscoreAuthorizationOptions()
        {
            Status = AuthorizationStatus.Enabled,
        };

        sc.AddUniscoreAuth(configuration, environment, options: options);
    }
}
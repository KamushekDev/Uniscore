using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.BFF.Mobile.Core.Profiles;
using Uniscore.BFF.Mobile.Core.Users;
using Uniscore.BFF.Mobile.Infrastructure.Profiles;
using Uniscore.BFF.Mobile.Infrastructure.Users;
using Uniscore.Shared.Auth.Extensions;
using Uniscore.Shared.Auth.Options;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Client.Extensions;

namespace Uniscore.BFF.Mobile.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static void AddInfrastructure(this IServiceCollection sc, ConfigurationManager configuration,
        IWebHostEnvironment environment)
    {
        sc.AddUniscoreHealthChecks();

        sc.AddAuth(configuration, environment);
        sc.AddUniscoreGrpc(configuration);
        sc.AddServices(configuration);
    }

    private static void AddServices(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddProfiles(configuration);
        
        sc.AddUsers(configuration);
    }

    private static void AddProfiles(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IProfileService, ProfileService>();
    }

    private static void AddUsers(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IUserService, UserService>();
        
        sc.AddUserApiClient(configuration);
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
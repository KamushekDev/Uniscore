using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Shared.Auth.Extensions;
using Uniscore.Shared.Auth.Options;
using Uniscore.Shared.Hosting;

namespace Uniscore.BFF.Mobile.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static void AddInfrastructure(this IServiceCollection sc, ConfigurationManager configuration, IWebHostEnvironment environment)
    {
        sc.AddUniscoreHealthChecks();
        
        sc.AddAuth(configuration, environment);

        sc.AddUniscoreGrpc();
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
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Scores.Core.Grades.Gateways;
using Uniscore.Scores.Infrastructure.Database;
using Uniscore.Scores.Infrastructure.Grades;
using Uniscore.Scores.Infrastructure.Options;
using Uniscore.Shared.Auth.Extensions;
using Uniscore.Shared.Auth.Options;
using Uniscore.Shared.Hosting;

namespace Uniscore.Scores.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc, IConfiguration configuration,
        IWebHostEnvironment environment)
    {
        sc.AddUniscoreHealthChecks();

        sc.AddAuth(configuration, environment);

        sc.AddUniscoreGrpc();

        sc.AddDatabase(configuration);

        sc.AddGradeVariants(configuration);
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

    private static void AddGradeVariants(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IGradeVariantsGateway, GradeVariantsGateway>();
    }

    private static void AddServices(this IServiceCollection sc, IConfiguration configuration) { }
}
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Scores.Core.Grades.Gateways;
using Uniscore.Scores.Infrastructure.Database;
using Uniscore.Scores.Infrastructure.Grades;
using Uniscore.Scores.Infrastructure.Options;

namespace Uniscore.Scores.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddOptions(configuration);
        sc.AddDatabase();
        sc.AddServices(configuration);
        sc.AddGateways(configuration);
        return sc;
    }

    private static void AddOptions(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddOptions<ConnectionOptions>()
            .Bind(configuration.GetSection(ConnectionOptions.SectionName));
    }

    private static void AddGateways(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IGradeVariantsGateway, GradeVariantsGateway>();
    }

    private static void AddServices(this IServiceCollection sc, IConfiguration configuration) { }
}
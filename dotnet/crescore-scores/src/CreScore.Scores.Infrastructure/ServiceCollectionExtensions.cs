using CreScore.Scores.Core.Grades.Gateways;
using CreScore.Scores.Infrastructure.Database;
using CreScore.Scores.Infrastructure.Grades;
using CreScore.Scores.Infrastructure.Options;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Scores.Infrastructure;

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
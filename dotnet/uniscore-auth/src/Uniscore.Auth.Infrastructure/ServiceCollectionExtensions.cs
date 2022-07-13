using Mapster;
using MapsterMapper;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Contract.Users;
using Uniscore.Auth.Infrastructure.Firebase;
using Uniscore.Auth.Users;

namespace Uniscore.Auth.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddFirebase(configuration);

        sc.AddMappings();

        return sc;
    }

    private static void AddMappings(this IServiceCollection sc)
    {
        var config = new TypeAdapterConfig()
        {
            RequireExplicitMapping = true,
            RequireDestinationMemberSource = true, 
            SelfContainedCodeGeneration = false
        };
        var list = config.Scan(
            typeof(IInfrastructureAssemblyMarker).Assembly
        );

        config.Compile();

        sc.AddSingleton(config);

        // sc.AddTransient<IMapper, ServiceMapper>();
    }
}
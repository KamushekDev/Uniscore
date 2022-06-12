using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Infrastructure.Firebase;

namespace Uniscore.Auth.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddFirebase(configuration);

        return sc;
    }
}
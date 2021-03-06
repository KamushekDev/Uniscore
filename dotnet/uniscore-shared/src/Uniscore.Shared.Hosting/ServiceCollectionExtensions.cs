using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace Uniscore.Shared.Hosting;

public static class ServiceCollectionExtensions
{
    public static void AddUniscoreHealthChecks(this IServiceCollection sc)
    {
        sc.AddHealthChecks()
            .AddCheck("live", () => HealthCheckResult.Healthy("live"), tags: new[] { "live" })
            .AddCheck("health", () => HealthCheckResult.Healthy("health"), tags: new[] { "health" });
    }
}
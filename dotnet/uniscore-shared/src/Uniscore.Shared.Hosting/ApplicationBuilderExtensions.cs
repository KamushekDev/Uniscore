using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;

namespace Uniscore.Shared.Hosting;

public static class ApplicationBuilderExtensions
{
    public static void UseUniscoreHealthChecks(this IApplicationBuilder builder)
    {
        builder.UseHealthChecks("/live", new HealthCheckOptions()
        {
            Predicate = reg => reg.Tags.Contains("live")
        });
        builder.UseHealthChecks("/health", new HealthCheckOptions()
        {
            Predicate = reg => reg.Tags.Contains("health")
        });
    }
}
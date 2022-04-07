using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;

namespace CreScore.Shared.Hosting;

public static class WebApplicationExtensions
{
    public static void UserCustomHealthChecks(this WebApplication app)
    {
        app.UseHealthChecks("/live", new HealthCheckOptions()
        {
            Predicate = reg => reg.Tags.Contains("live")
        });
        app.UseHealthChecks("/health", new HealthCheckOptions()
        {
            Predicate = reg => reg.Tags.Contains("health")
        });
    }
}
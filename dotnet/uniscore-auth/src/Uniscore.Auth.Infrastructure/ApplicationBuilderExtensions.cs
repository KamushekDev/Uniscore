using Microsoft.AspNetCore.Builder;
using Uniscore.Shared.Hosting;

namespace Uniscore.Auth.Infrastructure;

public static class ApplicationBuilderExtensions
{
    public static void UseInfrastructure(this IApplicationBuilder builder)
    {
        builder.UseUniscoreHealthChecks();
    }
}
using Microsoft.AspNetCore.Builder;
using Uniscore.Shared.Auth.Extensions;
using Uniscore.Shared.Hosting;

namespace Uniscore.BFF.Mobile.Infrastructure;

public static class ApplicationBuilderExtensions
{
    public static void UseInfrastructure(this IApplicationBuilder builder)
    {
        builder.UseRouting();
        builder.UseUniscoreHealthChecks();
        builder.UseUniscoreAuthorization();
    }
}
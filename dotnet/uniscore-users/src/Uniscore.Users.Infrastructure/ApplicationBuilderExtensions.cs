using Microsoft.AspNetCore.Builder;
using Uniscore.Auth.Provider.Extensions;
using Uniscore.Shared.Hosting;

namespace Uniscore.Users.Infrastructure;

public static class ApplicationBuilderExtensions
{
    public static void UseInfrastructure(this IApplicationBuilder builder)
    {
        builder.UseRouting();

        builder.UseCustomHealthChecks();

        builder.UseUniscoreAuthorization();
    }
}
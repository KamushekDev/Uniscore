using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Shared.Auth.Options;

namespace Uniscore.Shared.Auth.Extensions;

public static class ApplicationBuilderExtensions
{
    public static void UseUniscoreAuthorization(this IApplicationBuilder builder)
    {
        var config = builder.ApplicationServices.GetRequiredService<AuthorizationConfig>();

        if (!config.IsEnabled)
            return;

        builder.UseAuthentication();
        builder.UseAuthorization();
    }
}
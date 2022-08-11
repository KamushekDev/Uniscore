using Microsoft.AspNetCore.Builder;

namespace Uniscore.Auth.Provider.Extensions;

public static class ApplicationBuilderExtensions
{
    public static void UseUniscoreAuthorization(this IApplicationBuilder builder)
    {
        builder.UseAuthentication();
        builder.UseAuthorization();
    }
}
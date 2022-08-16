using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Uniscore.Shared.Auth.AuthStore;
using Uniscore.Shared.Auth.ContextMetadata;
using Uniscore.Shared.Auth.Handlers;
using Uniscore.Shared.Auth.Options;
using Uniscore.Shared.Auth.Requirements;

namespace Uniscore.Shared.Auth.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddUniscoreAuth(this IServiceCollection sc, IConfiguration configuration,
        IWebHostEnvironment environment, UniscoreAuthorizationOptions? options = null)
    {
        options ??= new UniscoreAuthorizationOptions();

        var config = ParseConfig(environment, options);
        sc.AddSingleton(config);

        if (!config.IsEnabled)
            return sc;

        sc.AddUniscoreAuthentication(configuration);
        sc.AddUniscoreAuthorization(configuration);

        sc.AddScoped<IAuthStore, AuthStore.AuthStore>();

        sc.AddSingleton<IContextMetadataExtractor, ContextMetadataExtractor>();

        return sc;
    }

    private static void AddUniscoreAuthentication(this IServiceCollection sc, IConfiguration configuration)
    {
        const string firebaseApplicationId = "unique-score";

        sc.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.Authority = "https://securetoken.google.com/" + firebaseApplicationId;
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidIssuer = "https://securetoken.google.com/" + firebaseApplicationId,
                    ValidateAudience = true,
                    ValidAudience = firebaseApplicationId,
                    ValidateLifetime = true
                };
            });
    }

    private static void AddUniscoreAuthorization(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IAuthorizationHandler, ExistingUserAuthorizationHandler>();

        sc.AddAuthorization(configure =>
        {
            configure.AddPolicy(Policies.ValidUser, policy =>
            {
                policy.RequireAuthenticatedUser();
                policy.Requirements.Add(new ExistingUserRequirement());
                policy.AuthenticationSchemes.Add(JwtBearerDefaults.AuthenticationScheme);
            });
            configure.DefaultPolicy = configure.GetPolicy(Policies.ValidUser)!;
        });
    }

    private static AuthorizationConfig ParseConfig(
        IWebHostEnvironment environment,
        UniscoreAuthorizationOptions options)
    {
        var isAuthorizationEnabled = options.Status switch
        {
            AuthorizationStatus.Disabled => false,
            AuthorizationStatus.DisabledOnDevelopment when environment.IsDevelopment() => false,
            AuthorizationStatus.EnabledOnPod when string.IsNullOrEmpty(Environment.GetEnvironmentVariable("HOSTNAME"))
                => false,
            _ => true
        };

        var configuration = new AuthorizationConfig()
        {
            IsEnabled = isAuthorizationEnabled
        };

        return configuration;
    }
}
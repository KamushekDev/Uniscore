using Grpc.AspNetCore.Server;
using Grpc.Net.ClientFactory;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Uniscore.Auth.Api;
using Uniscore.Auth.Client;
using Uniscore.Auth.Client.Gateway;
using Uniscore.Auth.Provider.Handlers;
using Uniscore.Auth.Provider.Options;
using Uniscore.Auth.Provider.Requirements;

namespace Uniscore.Auth.Provider.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddUniscoreAuth(this IServiceCollection sc, IConfiguration configuration,
        IWebHostEnvironment environment,
        Uri? authUri = null, UniscoreAuthorizationOptions? options = null)
    {
        options ??= new UniscoreAuthorizationOptions();

        authUri ??= new Uri("http://auth-service.uniscore:82");

        var config = ParseConfig(environment, options);
        sc.AddSingleton(config);

        if (!config.IsEnabled)
            return sc;

        sc.AddTransient<IAuthGateway, AuthGateway>();

        sc.AddUniscoreAuthentication(configuration);
        sc.AddUniscoreAuthorization(configuration);

        sc.AddScoped<ITokenStore, TokenStore>();

        sc.AddGrpcClient<AuthorizationApi.AuthorizationApiClient>("Uniscore Auth service",
            o => { o.Address = authUri; });

        return sc;
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

    private static void AddUniscoreAuthentication(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddScoped<IAuthenticationHandler, IdTokenAuthenticationHandler>();

        sc.AddAuthentication(options => { })
            .AddScheme<AuthenticationSchemeOptions, IdTokenAuthenticationHandler>(
                Schemes.UniscoreScheme,
                options => { }
            );
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
                policy.AuthenticationSchemes.Add(Schemes.UniscoreScheme);
            });
            configure.DefaultPolicy = configure.GetPolicy(Policies.ValidUser)!;
        });
    }

    public static IHttpClientBuilder AddCustomGrpcClient<TClient>(this IServiceCollection sc,
        Action<GrpcClientFactoryOptions> configureAction) where TClient : class
    {
        //sc.AddTransient<GrpcAuthClientInterceptor>();

        return sc.AddGrpcClient<TClient>(configureAction);
        //.AddInterceptor<GrpcAuthClientInterceptor>();
    }

    public static void AddCustomGrpc(this IServiceCollection sc, Action<GrpcServiceOptions> configure)
    {
        //sc.AddTransient<GrpcAuthServerInterceptor>();

        sc.AddGrpc(options =>
        {
            //options.Interceptors.Add<GrpcAuthServerInterceptor>();
            configure(options);
        });
    }
}
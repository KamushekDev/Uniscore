using Grpc.AspNetCore.Server;
using Grpc.Net.ClientFactory;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Client;
using Uniscore.Auth.Client.Gateway;
using Uniscore.Auth.Provider.Handlers;
using Uniscore.Auth.Provider.Requirements;
using Uniscore.Shared.Common;

namespace Uniscore.Auth.Provider.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddCreScoreAuth(this IServiceCollection sc, IConfiguration configuration,
        string? authServiceUri = null, int? authServicePort = null)
    {
        sc.AddTransient<IAuthGateway, AuthGateway>();

        sc.AddCreScoreAuthentication(configuration);
        sc.AddCreScoreAuthorization(configuration);

        sc.AddScoped<ITokenStore, TokenStore>();

        var uri = authServiceUri ?? "auth-service.uniscore";
        var port = authServicePort ?? 82;

        var authServiceUrl = new ServiceUriOptions(uri, port);

        sc.AddGrpcClient<AuthorizationApi.AuthorizationApiClient>("Uniscore Auth service",
            options => { options.Address = new Uri(authServiceUrl.Uri); });

        return sc;
    }

    private static void AddCreScoreAuthentication(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddScoped<IAuthenticationHandler, IdTokenAuthenticationHandler>();

        sc.AddAuthentication(options => { options.DefaultScheme = Schemes.CreScoreScheme; })
            .AddScheme<AuthenticationSchemeOptions, IdTokenAuthenticationHandler>(
                Schemes.CreScoreScheme,
                options => { }
            );
    }

    private static void AddCreScoreAuthorization(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IAuthorizationHandler, ExistingUserAuthorizationHandler>();

        sc.AddAuthorization(configure =>
        {
            configure.AddPolicy(Policies.ValidUser, policy =>
            {
                policy.RequireAuthenticatedUser();
                policy.Requirements.Add(new ExistingUserRequirement());
                policy.AuthenticationSchemes.Add(Schemes.CreScoreScheme);
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
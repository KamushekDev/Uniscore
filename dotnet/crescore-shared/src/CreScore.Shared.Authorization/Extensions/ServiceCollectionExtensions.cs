using CreScore.Auth;
using CreScore.Shared.Authorization.Interceptors;
using Grpc.AspNetCore.Server;
using Grpc.Net.ClientFactory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Shared.Authorization;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddCreScoreAuth(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddAuthentication(AuthConstants.CreScoreAuthScheme);
        sc.AddAuthorization(configure =>
        {
            //configure.AddPolicy("Firebase");
        });

        sc.AddScoped<ITokenStore, TokenStore>();

        var authUri = configuration.GetSection("CreScoreUri").Get<string>() ?? "https://crescore-auth:82";
        
        sc.AddGrpcClient<AuthorizationApi.AuthorizationApiClient>("CreScore Auth service", options =>
        {
            options.Address = new Uri(authUri);
        });

        return sc;
    }

    public static IHttpClientBuilder AddGrpcClientWithAuth<TClient>(this IServiceCollection sc,
        Action<GrpcClientFactoryOptions> configureAction) where TClient : class
    {
        sc.AddTransient<GrpcAuthClientInterceptor>();

        return sc.AddGrpcClient<TClient>(configureAction)
            .AddInterceptor<GrpcAuthClientInterceptor>();
    }

    public static void AddGrpcWithAuth(this IServiceCollection sc, Action<GrpcServiceOptions> configure)
    {
        sc.AddTransient<GrpcAuthServerInterceptor>();

        sc.AddGrpc(options =>
        {
            options.Interceptors.Add<GrpcAuthServerInterceptor>();
            configure(options);
        });
    }
}
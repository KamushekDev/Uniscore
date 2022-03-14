using CreScore.Auth.Helper.Helpers;
using CreScore.Auth.Helper.Interceptors;
using Grpc.AspNetCore.Server;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Auth.Helper;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddCreScoreAuth(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddAuthentication();
        sc.AddAuthorization(configure =>
        {
            //configure.AddPolicy("Firebase");
        });
        
        sc.AddScoped<ITokenStore, TokenStore>();

        sc.AddGrpcClient<AuthorizationApi.AuthorizationApiClient>();

        return sc;
    }

    public static void AddCreScoreAuthInterceptors(this GrpcServiceOptions options, IConfiguration configuration)
    {
        options.Interceptors.Add<GrpcTokenPassthroughInterceptor>();
    }
}
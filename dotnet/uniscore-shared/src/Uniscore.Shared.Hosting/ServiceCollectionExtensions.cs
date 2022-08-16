using Grpc.AspNetCore.Server;
using Grpc.Net.ClientFactory;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Uniscore.Shared.Auth.Interceptors;

namespace Uniscore.Shared.Hosting;

public static class ServiceCollectionExtensions
{
    public static void AddUniscoreHealthChecks(this IServiceCollection sc)
    {
        sc.AddHealthChecks()
            .AddCheck("live", () => HealthCheckResult.Healthy("live"), tags: new[] { "live" })
            .AddCheck("health", () => HealthCheckResult.Healthy("health"), tags: new[] { "health" });
    }

    public static IGrpcServerBuilder AddUniscoreGrpc(this IServiceCollection sc, Action<GrpcServiceOptions>? configure)
    {
        sc.TryAddTransient<GrpcAuthInterceptor>();

        return sc.AddGrpc(x =>
        {
            x.Interceptors.Add<GrpcAuthInterceptor>();
            configure?.Invoke(x);
        });
    }

    public static IHttpClientBuilder AddUniscoreGrpcClient<TClient>(this IServiceCollection sc, string serviceName,
        Action<GrpcClientFactoryOptions>? configure)
        where TClient : class
    {
        sc.TryAddTransient<GrpcAuthInterceptor>();

        return sc.AddGrpcClient<TClient>(x =>
            {
                x.Address = new Uri($"http://{serviceName}-service.uniscore:82");
                configure?.Invoke(x);
            })
            .AddInterceptor<GrpcAuthInterceptor>();
    }
}
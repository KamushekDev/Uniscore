using Grpc.Net.ClientFactory;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Api;

namespace Uniscore.Users.Client.Extensions;

public static class ServiceCollectionExtensions
{
    public static void AddUserApiClient(this IServiceCollection sc, string serviceName, Action<GrpcClientFactoryOptions>? configure = null)
    {
        sc.AddUniscoreGrpcClient<UsersApi.UsersApiClient>(serviceName, configure);
    }
}
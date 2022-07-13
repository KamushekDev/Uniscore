using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Services.Users;

namespace Uniscore.Auth.Services;

public static class ServiceCollectionExtensions
{
    public static void AddServices(this IServiceCollection sc)
    {
        sc.AddUserServices();
    }
}
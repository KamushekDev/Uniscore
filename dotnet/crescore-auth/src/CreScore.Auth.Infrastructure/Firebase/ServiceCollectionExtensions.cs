using CreScore.Auth.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Auth.Infrastructure.Firebase;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddFirebase(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddTransient<IAuthService, FirebaseAuthService>();

        return sc;
    }
}
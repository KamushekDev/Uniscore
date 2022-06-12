using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Uniscore.Auth.Core;

namespace Uniscore.Auth.Infrastructure.Firebase;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddFirebase(this IServiceCollection sc, IConfiguration configuration)
    {
        var firebaseSecretPath = configuration.GetSection("FirebaseSecretPath").Get<string>();
        sc.AddSingleton(GetFirebaseApp(firebaseSecretPath));

        sc.AddTransient<IAuthService, FirebaseAuthService>();

        return sc;
    }

    private static FirebaseApp GetFirebaseApp(string path)
    {
        return FirebaseApp.Create(new AppOptions()
        {
            Credential = GoogleCredential.FromFile(path)
        });
    }
}
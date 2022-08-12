using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Uniscore.Users.Infrastructure.Firebase;

public static class ServiceCollectionExtensions
{
    public static void AddFirebase(this IServiceCollection sc, IConfiguration configuration)
    {
        var firebaseSecretPath = configuration.GetSection("FirebaseSecretPath").Get<string>();
        sc.AddSingleton(GetFirebaseApp(firebaseSecretPath));
    }


    private static FirebaseApp GetFirebaseApp(string path)
    {
        return FirebaseApp.Create(new AppOptions()
        {
            Credential = GoogleCredential.FromFile(path)
        });
    }
}
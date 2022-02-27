using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Scores.Infrastructure.Firebase;

public static class ServiceCollectionExtensions
{
    public static void AddFirebase(this IServiceCollection serviceCollection)
    {
        var app = FirebaseApp.Create(new AppOptions()
        {
            Credential = GoogleCredential.FromFile("secrets/crescore-adminsdk.json")
        });

        serviceCollection.AddSingleton<FirebaseApp>(app);
        serviceCollection.AddSingleton<IAuthService, AuthService>();
    }
}

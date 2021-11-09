using System;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using RestEase.HttpClientFactory;
using CreScore.Events.Twitch.Clients.Twitch;
using CreScore.Events.Twitch.Infrastructure.Handlers;

namespace CreScore.Events.Twitch.Infrastructure.Clients
{
    public static class ServiceCollectionExtensions
    {
        public static void AddTwitchClient(this IServiceCollection sc, IConfiguration configuration)
        {
            sc.AddOptions<TwitchOptions>()
                .Bind(configuration.GetSection(TwitchOptions.OptionsName))
                .ValidateDataAnnotations();

            sc.AddSingleton<ITwitchAuthorizationService, TwitchAuthorizationService>();
            // sc.AddTransient<A>();

            sc.AddRestEaseClient<ITwitchAuthorization>();
            sc.AddHttpClient("twitch")
                .ConfigureHttpClient((sp, client) =>
                {
                    var options = sp.GetRequiredService<IOptions<TwitchOptions>>().Value;
                    client.BaseAddress = new Uri(options.BaseApiUrl);
                })
                .UseWithRestEaseClient<ITwitchApi>()
                .AddHttpMessageHandler<AutoAuthorizationHandler>();
        }
    }
}
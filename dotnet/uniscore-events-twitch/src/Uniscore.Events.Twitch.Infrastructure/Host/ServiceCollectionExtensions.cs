using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Events.Twitch.Infrastructure.Host
{
    public static class ServiceCollectionExtensions
    {
        public static void AddHost(this IServiceCollection sc, IConfiguration configuration)
        {
            sc.AddOptions<HostOptions>()
                .Bind(configuration.GetSection(HostOptions.OptionsName))
                .ValidateDataAnnotations();
        }
    }
}
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CreScore.Events.Twitch.Infrastructure.Kafka
{
    public static class ServiceCollectionExtensions
    {
        public static void AddKafka(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddOptions<KafkaOptions>()
                .Bind(configuration.GetSection(KafkaOptions.OptionsName))
                .ValidateDataAnnotations();
        }
    }
}
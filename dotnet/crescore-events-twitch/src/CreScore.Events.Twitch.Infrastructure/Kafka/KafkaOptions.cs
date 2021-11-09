namespace CreScore.Events.Twitch.Infrastructure.Kafka
{
    public class KafkaOptions
    {
        public const string OptionsName = "Kafka";

        public string BootstrapServers { get; init; }
    }
}
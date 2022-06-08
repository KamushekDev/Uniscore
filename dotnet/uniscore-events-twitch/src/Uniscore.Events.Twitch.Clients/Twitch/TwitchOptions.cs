namespace CreScore.Events.Twitch.Clients.Twitch
{
    public class TwitchOptions
    {
        public const string OptionsName = "TwitchOptions";

        public string BaseApiUrl { get; init; }
        
        public string ClientId { get; init; }
        public string ClientSecret { get; init; }
        public string SubscriptionsSecret { get; init; }
    }
}
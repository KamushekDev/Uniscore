using System.Threading.Tasks;
using CreScore.Events.Twitch.Clients.Twitch.Models;
using RestEase;
using CreScore.Events.Twitch.Core.Models;

namespace CreScore.Events.Twitch.Clients.Twitch
{
    public interface ITwitchAuthorization
    {
        [Path("clientId")]
        public string ClientId { get; set; }

        [Path("clientSecret")]
        public string ClientSecret { get; set; }

        [Post(
            "https://id.twitch.tv/oauth2/token?client_id={clientId}&client_secret={clientSecret}&grant_type=client_credentials&scope={scope}")]
        public Task<AppTokenResponse> Authorize([Path("scope")] string? scope = null);
    }

    public interface ITwitchApi
    {
        [Header("Client-ID")]
        public string ClientId { get; set; }

        [Get("/eventsub/subscriptions")]
        public Task<GetSubscriptionsResponse> GetSubscriptions();

        [Post("/eventsub/subscriptions")]
        public Task<string> Subscribe([Body] string request);
    }
}
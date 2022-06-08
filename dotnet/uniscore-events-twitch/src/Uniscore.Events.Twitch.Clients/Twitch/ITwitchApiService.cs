using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using CreScore.Events.Twitch.Core.Models;

namespace CreScore.Events.Twitch.Clients.Twitch
{
    public interface ITwitchApiService
    {
        ITwitchApi GetTwitchApi();
        TwitchOptions GetTwitchOptions();
        Task<JToken> SubscribeToChannelFollow(ChannelFollowRequest request);
    }
}
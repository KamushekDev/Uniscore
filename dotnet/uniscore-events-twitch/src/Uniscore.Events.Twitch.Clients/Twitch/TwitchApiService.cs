using System;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using CreScore.Events.Twitch.Clients.Twitch.Models;
using CreScore.Events.Twitch.Core.Models;

namespace CreScore.Events.Twitch.Clients.Twitch
{
    public class TwitchApiService : ITwitchApiService
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IOptionsMonitor<TwitchOptions> _twitchOptionsMonitor;

        private readonly JsonSerializerSettings _jsonOptions = new()
        {
            NullValueHandling = NullValueHandling.Ignore,
            DefaultValueHandling = DefaultValueHandling.Include,
        };

        public TwitchApiService(IServiceProvider serviceProvider, IOptionsMonitor<TwitchOptions> twitchOptionsMonitor)
        {
            _serviceProvider = serviceProvider;
            _twitchOptionsMonitor = twitchOptionsMonitor;
        }

        public TwitchOptions GetTwitchOptions() => _twitchOptionsMonitor.CurrentValue;

        public ITwitchApi GetTwitchApi()
        {
            var options = _twitchOptionsMonitor.CurrentValue;
            var api = _serviceProvider.GetRequiredService<ITwitchApi>();
            api.ClientId = options.ClientId;
            return api;
        }

        public async Task<JToken> SubscribeToChannelFollow(ChannelFollowRequest request)
        {
            var stringRequest = JsonConvert.SerializeObject(request, _jsonOptions);

            var response = await GetTwitchApi().Subscribe(stringRequest);

            return JToken.Parse(response);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using CreScore.Events.Twitch.Clients.Twitch.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;

namespace CreScore.Events.Twitch.Clients.Twitch
{
    public class TwitchAuthorizationService : ITwitchAuthorizationService
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IOptionsMonitor<TwitchOptions> _twitchOptionsMonitor;

        public TwitchAuthorizationService(IServiceProvider serviceProvider,
            IOptionsMonitor<TwitchOptions> twitchOptionsMonitor)
        {
            _serviceProvider = serviceProvider;
            _twitchOptionsMonitor = twitchOptionsMonitor;
        }

        public IList<string> Scopes = new List<string>();

        public string Scope => string.Join(' ', Scopes);

        public async Task<AppTokenResponse> GetAppAccessToken(string? scopeParam = null)
        {
            var twitch = _serviceProvider.GetRequiredService<ITwitchAuthorization>();
            var twitchOptions = _twitchOptionsMonitor.CurrentValue;
            twitch.ClientId = twitchOptions.ClientId;
            twitch.ClientSecret = twitchOptions.ClientSecret;

            var scope = scopeParam ?? Scope;

            return await twitch.Authorize(scope);
        }
    }
}
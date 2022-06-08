using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using CreScore.Events.Twitch.Clients.Twitch;
using CreScore.Events.Twitch.Clients.Twitch.Models;

namespace CreScore.Events.Twitch.Infrastructure.Handlers
{
    public class AutoAuthorizationHandler : DelegatingHandler
    {
        private readonly ILogger<AutoAuthorizationHandler> _logger;
        private readonly ITwitchAuthorizationService _authorizationService;
        private readonly TwitchOptions _twitchOptions;

        private AppTokenResponse _token = new();


        public AutoAuthorizationHandler(ILogger<AutoAuthorizationHandler> logger,
            ITwitchAuthorizationService authorizationService,
            IOptionsSnapshot<TwitchOptions> twitchOptions)
        {
            _logger = logger;
            _twitchOptions = twitchOptions.Value;
            _authorizationService = authorizationService;
        }

        protected override async Task<HttpResponseMessage> SendAsync(
            HttpRequestMessage request, CancellationToken cancellationToken)
        {
            if (request.Headers.Remove("Client-ID"))
                request.Headers.Add("Client-ID", _twitchOptions.ClientId);

            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", _token.AccessToken);
            var response = await base.SendAsync(request, cancellationToken);

            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                _logger.LogDebug("Requesting new app access token");
                _token = await _authorizationService.GetAppAccessToken();
                request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", _token.AccessToken);

                return await base.SendAsync(request, cancellationToken);
            }

            return response;
        }
    }
}
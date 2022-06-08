using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CreScore.Events.Twitch.Clients.Twitch;
using CreScore.Events.Twitch.Clients.Twitch.Models;
using CreScore.Events.Twitch.Core.Models;

namespace CreScore.Events.Twitch.Controllers
{
    [ApiController]
    [Route("twitch")]
    public class RestEaseController : ControllerBase
    {
        private readonly ITwitchApiService _twitchService;

        public RestEaseController(ITwitchApiService twitchService)
        {
            _twitchService = twitchService;
        }

        #region Subscriptions

        [HttpGet("getSubscriptions")]
        public async Task<GetSubscriptionsResponse> GetSubscriptions()
        {
            var response = await _twitchService.GetTwitchApi().GetSubscriptions();
            return response;
        }

        public enum SubscriptionType
        {
            ChannelFollow,
        }

        [HttpPost("subscribe")]
        public async Task<string> Subscribe([FromQuery] SubscriptionType request)
        {
            switch (request)
            {
                case SubscriptionType.ChannelFollow:
                    return _twitchService.SubscribeToChannelFollow(new ChannelFollowRequest
                    {
                        Condition = new ChannelFollowCondition
                        {
                            BroadcasterUserId = "12826"
                        },
                        Transport = new Transport
                        {
                            Method = "webhook",
                            Secret = _twitchService.GetTwitchOptions().SubscriptionsSecret,
                            Callback = "https://6a17-31-134-151-83.ngrok.io/eventsub/callback/"
                        },
                        Type = "channel.follow",
                        Version = ""
                    }).ToString()!;
                    break;
                default:
                    throw new NotSupportedException();
                    break;
            }
        }

        #endregion

        // [HttpPost("Authorize")]
        // public async Task<IActionResult> Authorize([FromServices] ITwitchAuthorization twitchAuthorization,
        //     [FromQuery]
        //     string? scope = null)
        // {
        //     return new OkObjectResult(await twitchAuthorization.Authorize(scope));
        // }
    }
}
using System;
using System.Net;
using System.Threading.Tasks;
using Confluent.Kafka;
using CreScore.Events.Twitch.Attributes;
using CreScore.Events.Twitch.Contract;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using CreScore.Events.Twitch.Core.Models;
using CreScore.Events.Twitch.Infrastructure.Kafka;

namespace CreScore.Events.Twitch.Controllers
{
    [ApiController]
    [CheckSignature]
    [Route("eventsub/callback")]
    public class EventSubController : ControllerBase
    {
        private readonly ILogger<EventSubController> _logger;

        private readonly IProducer<string, string> _producer;

        public EventSubController(ILogger<EventSubController> logger, IOptionsSnapshot<KafkaOptions> kafkaOptions)
        {
            _logger = logger;

            var producerConfig = new ProducerConfig
            {
                BootstrapServers = kafkaOptions.Value.BootstrapServers,
                ClientId = $"score-events-twitch:{Dns.GetHostName()}",
            };

            _producer = new ProducerBuilder<string, string>(producerConfig).Build();
        }

        private async Task ProduceMessage<T>(string key, T message, string topic = "twitch_follows")
            where T : class
        {
            var jsonSerializerSettings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Include,
                DefaultValueHandling = DefaultValueHandling.Include,
                Formatting = Formatting.None,
            };

            var json = JsonConvert.SerializeObject(message, jsonSerializerSettings);

            await _producer.ProduceAsync(topic,
                new Message<string, string>
                    { Value = json, Key = key, Timestamp = new Timestamp(DateTime.Now) });
        }

        private HeaderValues GetHeaderValuesFromHeaders() =>
            new()
            {
                Id = Request.Headers["Twitch-Eventsub-Message-Id"],
                Retry = int.Parse(Request.Headers["Twitch-Eventsub-Message-Retry"]),
                Type = Request.Headers["Twitch-Eventsub-Message-Type"],
                IsBatching = bool.Parse(Request.Headers["Twitch-Eventsub-Subscription-Is-Batching-Enabled"]),
                SubscriptionType = Request.Headers["Twitch-Eventsub-Subscription-Type"],
                SubscriptionVersion = Request.Headers["Twitch-Eventsub-Subscription-Version"],
                TimeStamp = DateTime.Parse(Request.Headers["Twitch-Eventsub-Message-Timestamp"])
            };

        [HttpPost("channel.follow")]
        public async Task<IActionResult> ChannelFollow([FromBody] ChannelFollowPayload payload)
        {
            _logger.LogInformation(JsonConvert.SerializeObject(payload));
            return NoContent();
        }

        [HttpPost("channel.channel_points_custom_reward_redemption.add")]
        public async Task<IActionResult> ChannelPointsCustomRewardRedemptionAdd(
            [FromBody]
            ChannelPointsCustomRewardRedemptionAddPayload payload)
        {
            if (!string.IsNullOrEmpty(payload.Challenge))
            {
                _logger.LogInformation("Confirmed subscription with id: {SubscriptionId}", payload.Subscription.Id);
                return new OkObjectResult(payload.Challenge);
            }

            var headers = GetHeaderValuesFromHeaders();

            var order = OrderEvent.Created(
                "twitch.tv",
                payload.Event.BroadcasterUserId,
                payload.Event.BroadcasterUserName,
                payload.Event.Id,
                payload.Event.UserInput,
                payload.Event.UserId,
                payload.Event.UserName,
                payload.Event.RedeemedAt
            );

            await ProduceMessage(headers.Id, order);

            _logger.LogDebug(
                "Handled 'channel.channel_points_custom_reward_redemption.add' message with id: {MessageId}",
                headers.Id);

            return new NoContentResult();
        }

        [HttpPost("channel.channel_points_custom_reward_redemption.update")]
        public async Task<IActionResult> ChannelPointsCustomRewardRedemptionUpdate(
            [FromBody]
            ChannelPointsCustomRewardRedemptionUpdatePayload payload)
        {
            return BadRequest();
        }
    }
}
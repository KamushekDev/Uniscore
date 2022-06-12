using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Newtonsoft.Json;

// ReSharper disable ClassNeverInstantiated.Global
// ReSharper disable UnusedAutoPropertyAccessor.Global

namespace CreScore.Events.Twitch.Core.Models
{
    #region Requests

    public class ChannelPollBeginRequest : Request<ChannelPollBeginCondition> { }

    public class ChannelPollProgressRequest : Request<ChannelPollProgressCondition> { }

    public class ChannelPollEndRequest : Request<ChannelPollEndCondition> { }

    public class ChannelPointsCustomRewardRedemptionAddRequest
        : Request<ChannelPointsCustomRewardRedemptionAddCondition> { }

    public class ChannelPointsCustomRewardRedemptionUpdateRequest
        : Request<ChannelPointsCustomRewardRedemptionUpdateCondition> { }

    public class ChannelFollowRequest : Request<ChannelFollowCondition> { }

    public abstract class Request<TCondition>
        where TCondition : ICondition
    {
        /// <summary>
        /// The subscription type name.
        /// </summary>
        [Required]
        [JsonProperty("type")]
        [JsonPropertyName("type")]
        public string Type { get; init; } = null!;

        /// <summary>
        /// Subscription-specific parameters. The parameters inside this object differ by subscription type and may differ by version.
        /// </summary>
        [Required]
        [JsonProperty("condition")]
        [JsonPropertyName("condition")]
        public TCondition Condition { get; init; } = default!;

        /// <summary>
        /// Transport-specific parameters.
        /// </summary>
        [Required]
        [JsonProperty("transport")]
        [JsonPropertyName("transport")]
        public Transport Transport { get; init; } = null!;

        /// <summary>
        /// The subscription type version: 1.
        /// </summary>
        [JsonProperty("version")]
        [JsonPropertyName("version")]
        public string Version { get; init; } = "1";
    }

    #endregion

    #region Payloads

    public abstract class Payload<TCondition, TEvent> where TCondition : ICondition
        where TEvent : IEvent
    {
        [Required]
        [JsonProperty("subscription")]
        [JsonPropertyName("subscription")]
        public Subscription<TCondition> Subscription { get; init; } = null!;

        [Required]
        [JsonProperty("event")]
        [JsonPropertyName("event")]
        public TEvent Event { get; init; } = default!;

        [JsonProperty("challenge")]
        [JsonPropertyName("challenge")]
        public string? Challenge { get; init; }
    }

    public class ChannelPollBeginPayload : Payload<ChannelPollBeginCondition, ChannelPollBeginEvent> { }

    public class ChannelPollProgressPayload : Payload<ChannelPollProgressCondition, ChannelPollProgressEvent> { }

    public class ChannelPollEndPayload : Payload<ChannelPollEndCondition, ChannelPollEndEvent> { }

    public class ChannelPointsCustomRewardRedemptionAddPayload :
        Payload<ChannelPointsCustomRewardRedemptionAddCondition, ChannelPointsCustomRewardRedemptionAddEvent> { }

    public class ChannelPointsCustomRewardRedemptionUpdatePayload :
        Payload<ChannelPointsCustomRewardRedemptionUpdateCondition, ChannelPointsCustomRewardRedemptionUpdateEvent> { }

    public class ChannelFollowPayload : Payload<ChannelFollowCondition, ChannelFollowEvent> { }

    #endregion

    #region Conditions

    public interface ICondition { }

    public sealed class ChannelPointsCustomRewardRedemptionAddCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        [JsonProperty("reward_id")]
        [JsonPropertyName("reward_id")]
        public string? RewardId { get; init; }
    }

    public sealed class ChannelPointsCustomRewardRedemptionUpdateCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        [JsonProperty("reward_id")]
        [JsonPropertyName("reward_id")]
        public string? RewardId { get; init; }
    }

    public sealed class ChannelPollBeginCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;
    }

    public sealed class ChannelPollProgressCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;
    }

    public sealed class ChannelPollEndCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;
    }

    public sealed class ChannelFollowCondition : ICondition
    {
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;
    }

    #endregion

    #region Events

    public interface IEvent { }

    public sealed class ChannelPollBeginEvent : IEvent
    {
        /// <summary>ID of the poll.</summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = null!;

        /// <summary>The requested broadcaster ID.</summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        /// <summary>The requested broadcaster login.</summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = null!;

        /// <summary>The requested broadcaster display name.</summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = null!;

        /// <summary>Question displayed for the poll.</summary>
        [Required]
        [JsonProperty("title")]
        [JsonPropertyName("title")]
        public string Title { get; init; } = null!;

        /// <summary>An array of choices for the poll.</summary>
        [Required]
        [JsonProperty("choices")]
        [JsonPropertyName("choices")]
        public ICollection<Choice> Choices { get; init; } = null!;

        /// <summary>The Bits voting settings for the poll.</summary>
        [Required]
        [JsonProperty("bits_voting")]
        [JsonPropertyName("bits_voting")]
        public BitsVoting BitsVoting { get; init; } = null!;

        /// <summary>The Channel Points voting settings for the poll.</summary>
        [Required]
        [JsonProperty("channel_points_voting")]
        [JsonPropertyName("channel_points_voting")]
        public ChannelPointsVoting ChannelPointsVoting { get; init; } = null!;

        /// <summary>The time the poll started.</summary>
        [Required]
        [JsonProperty("started_at")]
        [JsonPropertyName("started_at")]
        public string StartedAt { get; init; } = null!;

        /// <summary>The time the poll will end.</summary>
        [Required]
        [JsonProperty("ends_at")]
        [JsonPropertyName("ends_at")]
        public string EndsAt { get; init; } = null!;
    }

    public sealed class ChannelPollProgressEvent : IEvent
    {
        /// <summary>ID of the poll.</summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = null!;

        /// <summary>The requested broadcaster ID.</summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        /// <summary>The requested broadcaster login.</summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = null!;

        /// <summary>The requested broadcaster display name.</summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = null!;

        /// <summary>Question displayed for the poll.</summary>
        [Required]
        [JsonProperty("title")]
        [JsonPropertyName("title")]
        public string Title { get; init; } = null!;

        /// <summary>An array of choices for the poll.</summary>
        [Required]
        [JsonProperty("choices")]
        [JsonPropertyName("choices")]
        public ICollection<Choice> Choices { get; init; } = null!;

        /// <summary>The Bits voting settings for the poll.</summary>
        [Required]
        [JsonProperty("bits_voting")]
        [JsonPropertyName("bits_voting")]
        public BitsVoting BitsVoting { get; init; } = null!;

        /// <summary>The Channel Points voting settings for the poll.</summary>
        [Required]
        [JsonProperty("channel_points_voting")]
        [JsonPropertyName("channel_points_voting")]
        public ChannelPointsVoting ChannelPointsVoting { get; init; } = null!;

        /// <summary>The time the poll started.</summary>
        [Required]
        [JsonProperty("started_at")]
        [JsonPropertyName("started_at")]
        public string StartedAt { get; init; } = null!;

        /// <summary>The time the poll will end.</summary>
        [Required]
        [JsonProperty("ends_at")]
        [JsonPropertyName("ends_at")]
        public string EndsAt { get; init; } = null!;
    }

    public sealed class ChannelPollEndEvent : IEvent
    {
        /// <summary>ID of the poll.</summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = null!;

        /// <summary>The requested broadcaster ID.</summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        /// <summary>The requested broadcaster login.</summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = null!;

        /// <summary>The requested broadcaster display name.</summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = null!;

        /// <summary>Question displayed for the poll.</summary>
        [Required]
        [JsonProperty("title")]
        [JsonPropertyName("title")]
        public string Title { get; init; } = null!;

        /// <summary>An array of choices for the poll.</summary>
        [Required]
        [JsonProperty("choices")]
        [JsonPropertyName("choices")]
        public ICollection<Choice> Choices { get; init; } = null!;

        /// <summary>The Bits voting settings for the poll.</summary>
        [Required]
        [JsonProperty("bits_voting")]
        [JsonPropertyName("bits_voting")]
        public BitsVoting BitsVoting { get; init; } = null!;

        /// <summary>The Channel Points voting settings for the poll.</summary>
        [Required]
        [JsonProperty("channel_points_voting")]
        [JsonPropertyName("channel_points_voting")]
        public ChannelPointsVoting ChannelPointsVoting { get; init; } = null!;

        /// <summary>The time the poll started.</summary>
        [Required]
        [JsonProperty("started_at")]
        [JsonPropertyName("started_at")]
        public string StartedAt { get; init; } = null!;

        /// <summary>The status of the poll.</summary>
        [Required]
        [JsonProperty("status")]
        [JsonPropertyName("status")]
        public PollEndStatus Status { get; init; }

        /// <summary>The time the poll ended.</summary>
        [Required]
        [JsonProperty("ended_at")]
        [JsonPropertyName("ended_at")]
        public string EndedAt { get; init; } = null!;
    }

    public sealed class ChannelPointsCustomRewardRedemptionAddEvent : IEvent
    {
        /// <summary>
        /// The redemption identifier.
        /// </summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster ID.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster login.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster display name.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = default!;

        /// <summary>
        /// User ID of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_id")]
        [JsonPropertyName("user_id")]
        public string UserId { get; init; } = default!;

        /// <summary>
        /// Login of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_login")]
        [JsonPropertyName("user_login")]
        public string UserLogin { get; init; } = default!;

        /// <summary>
        /// Display name of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_name")]
        [JsonPropertyName("user_name")]
        public string UserName { get; init; } = default!;

        /// <summary>
        /// The user input provided. Empty string if not provided.
        /// </summary>
        [Required]
        [JsonProperty("user_input")]
        [JsonPropertyName("user_input")]
        public string UserInput { get; init; } = default!;

        /// <summary>
        /// Defaults to <c>unfulfilled</c>. Possible values are <c>unknown</c>, <c>unfulfilled</c>, <c>fulfilled</c>, and <c>canceled</c>.
        /// </summary>
        [Required]
        [JsonProperty("status")]
        [JsonPropertyName("status")]
        public string Status { get; init; } = default!;

        /// <summary>
        /// Basic information about the reward that was redeemed, at the time it was redeemed.
        /// </summary>
        [Required]
        [JsonProperty("reward")]
        [JsonPropertyName("reward")]
        public Reward Reward { get; init; } = default!;

        /// <summary>
        /// RFC3339 timestamp of when the reward was redeemed.
        /// </summary>
        [Required]
        [JsonProperty("redeemed_at")]
        [JsonPropertyName("redeemed_at")]
        public string RedeemedAt { get; init; } = default!;
    }

    public sealed class ChannelPointsCustomRewardRedemptionUpdateEvent : IEvent
    {
        /// <summary>
        /// The redemption identifier.
        /// </summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster ID.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster login.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = default!;

        /// <summary>
        /// The requested broadcaster display name.
        /// </summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = default!;

        /// <summary>
        /// User ID of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_id")]
        [JsonPropertyName("user_id")]
        public string UserId { get; init; } = default!;

        /// <summary>
        /// Login of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_login")]
        [JsonPropertyName("user_login")]
        public string UserLogin { get; init; } = default!;

        /// <summary>
        /// Display name of the user that redeemed the reward.
        /// </summary>
        [Required]
        [JsonProperty("user_name")]
        [JsonPropertyName("user_name")]
        public string UserName { get; init; } = default!;

        /// <summary>
        /// The user input provided. Empty string if not provided.
        /// </summary>
        [Required]
        [JsonProperty("user_input")]
        [JsonPropertyName("user_input")]
        public string UserInput { get; init; } = default!;

        /// <summary>
        /// Will be <c>fulfilled</c> or <c>canceled</c>. Possible values are <c>unknown</c>, <c>unfulfilled</c>, <c>fulfilled</c>, and <c>canceled</c>.
        /// </summary>
        [Required]
        [JsonProperty("status")]
        [JsonPropertyName("status")]
        public string Status { get; init; } = default!;

        /// <summary>
        /// Basic information about the reward that was redeemed, at the time it was redeemed.
        /// </summary>
        [Required]
        [JsonProperty("reward")]
        [JsonPropertyName("reward")]
        public Reward Reward { get; init; } = default!;

        /// <summary>
        /// RFC3339 timestamp of when the reward was redeemed.
        /// </summary>
        [Required]
        [JsonProperty("redeemed_at")]
        [JsonPropertyName("redeemed_at")]
        public string RedeemedAt { get; init; } = default!;
    }

    public sealed class ChannelFollowEvent : IEvent
    {
        /// <summary>The user ID for the user now following the specified channel.</summary>
        [Required]
        [JsonProperty("user_id")]
        [JsonPropertyName("user_id")]
        public string UserId { get; init; } = null!;

        /// <summary>The user login for the user now following the specified channel.</summary>
        [Required]
        [JsonProperty("user_login")]
        [JsonPropertyName("user_login")]
        public string UserLogin { get; init; } = null!;

        /// <summary>The user display name for the user now following the specified channel.</summary>
        [Required]
        [JsonProperty("user_name")]
        [JsonPropertyName("user_name")]
        public string UserName { get; init; } = null!;

        /// <summary>The requested broadcaster ID.</summary>
        [Required]
        [JsonProperty("broadcaster_user_id")]
        [JsonPropertyName("broadcaster_user_id")]
        public string BroadcasterUserId { get; init; } = null!;

        /// <summary>The requested broadcaster login.</summary>
        [Required]
        [JsonProperty("broadcaster_user_login")]
        [JsonPropertyName("broadcaster_user_login")]
        public string BroadcasterUserLogin { get; init; } = null!;

        /// <summary>The requested broadcaster display name.</summary>
        [Required]
        [JsonProperty("broadcaster_user_name")]
        [JsonPropertyName("broadcaster_user_name")]
        public string BroadcasterUserName { get; init; } = null!;

        /// <summary>RFC3339 timestamp of when the follow occurred.</summary>
        [Required]
        [JsonProperty("followed_at")]
        [JsonPropertyName("followed_at")]
        public string FollowedAt { get; init; } = null!;
    }

    #endregion

    /// <summary>
    /// Объект, содержащий данные из прилетающих с <see cref="Payload{TCondition,TEvent}"/>в заголовках.
    /// </summary>
    public class HeaderValues
    {
        [JsonProperty("Twitch-Eventsub-Message-Id")]
        [JsonPropertyName("Twitch-Eventsub-Message-Id")]
        public string Id { get; set; } = default!;

        [JsonProperty("Twitch-Eventsub-Message-Retry")]
        [JsonPropertyName("Twitch-Eventsub-Message-Retry")]
        public int Retry { get; set; }

        [JsonProperty("Twitch-Eventsub-Message-Timestamp")]
        [JsonPropertyName("Twitch-Eventsub-Message-Timestamp")]
        public DateTime TimeStamp { get; set; }

        [JsonProperty("Twitch-Eventsub-Message-Type")]
        [JsonPropertyName("Twitch-Eventsub-Message-Type")]
        public string Type { get; set; } = default!;

        [JsonProperty("Twitch-Eventsub-Subscription-Is-Batching-Enabled")]
        [JsonPropertyName("Twitch-Eventsub-Subscription-Is-Batching-Enabled")]
        public bool IsBatching { get; set; }

        [JsonProperty("Twitch-Eventsub-Subscription-Type")]
        [JsonPropertyName("Twitch-Eventsub-Subscription-Type")]
        public string SubscriptionType { get; set; } = default!;

        [JsonProperty("Twitch-Eventsub-Subscription-Version")]
        [JsonPropertyName("Twitch-Eventsub-Subscription-Version")]
        public string SubscriptionVersion { get; set; } = default!;
    }

    public enum PollEndStatus
    {
        Completed,
        Archived,
        Terminated
    }

    public sealed class BitsVoting
    {
        /// <summary>Indicates if Bits can be used for voting.</summary>
        [JsonProperty("is_enabled")]
        [JsonPropertyName("is_enabled")]
        public bool IsEnabled { get; init; }

        /// <summary>Number of Bits required to vote once with Bits.</summary>
        [JsonProperty("amount_per_vote")]
        [JsonPropertyName("amount_per_vote")]
        public int AmountPerVote { get; init; }
    }

    public sealed class ChannelPointsVoting
    {
        /// <summary>Indicates if Channel Points can be used for voting.</summary>
        [JsonProperty("is_enabled")]
        [JsonPropertyName("is_enabled")]
        public bool IsEnabled { get; init; }

        /// <summary>Number of Channel Points required to vote once with Channel Points.</summary>
        [JsonProperty("amount_per_vote")]
        [JsonPropertyName("amount_per_vote")]
        public int AmountPerVote { get; init; }
    }

    public class Subscription<TCondition> where TCondition : ICondition
    {
        /// <summary>Your client ID.</summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = null!;

        /// <summary>The notification’s subscription type.</summary>
        [Required]
        [JsonProperty("type")]
        [JsonPropertyName("type")]
        public string Type { get; init; } = null!;

        /// <summary>The version of the subscription.</summary>
        [Required]
        [JsonProperty("version")]
        [JsonPropertyName("version")]
        public string Version { get; init; } = null!;

        /// <summary>The status of the subscription.</summary>
        [Required]
        [JsonProperty("status")]
        [JsonPropertyName("status")]
        public string Status { get; init; } = null!;

        /// <summary>How much the subscription counts against your limit.</summary>
        [Required]
        [JsonProperty("cost")]
        [JsonPropertyName("cost")]
        public int Cost { get; init; }

        /// <summary>Subscription-specific parameters.</summary>
        [Required]
        [JsonProperty("condition")]
        [JsonPropertyName("condition")]
        public TCondition Condition { get; init; } = default!;

        /// <summary>The time the notification was created.</summary>
        [Required]
        [JsonProperty("created_at")]
        [JsonPropertyName("created_at")]
        public string CreatedAt { get; init; } = null!;

        /// <summary>Transport-specific parameters.</summary>
        [JsonProperty("transport")]
        [JsonPropertyName("transport")]
        public Transport? Transport { get; init; }
    }

    /// <summary>
    /// An array of the choices for a particular poll. Each poll’s event payload includes a choices array. The choices array contains an object that describes each choice and, if applicable, the votes for that choice.
    /// </summary>
    public sealed class Choice
    {
        /// <summary>ID for the choice.</summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = null!;

        /// <summary>Text displayed for the choice.</summary>
        [Required]
        [JsonProperty("title")]
        [JsonPropertyName("title")]
        public string Title { get; init; } = null!;

        /// <summary>Number of votes received via Bits.</summary>
        [Required]
        [JsonProperty("bits_votes")]
        [JsonPropertyName("bits_votes")]
        public int? BitsVotes { get; init; }

        /// <summary>Number of votes received via Channel Points.</summary>
        [Required]
        [JsonProperty("channel_points_votes")]
        [JsonPropertyName("channel_points_votes")]
        public int? ChannelPointsVotes { get; init; }

        /// <summary>Total number of votes received for the choice across all methods of voting.</summary>
        [Required]
        [JsonProperty("votes")]
        [JsonPropertyName("votes")]
        public int? Votes { get; init; }
    }

    public sealed class Reward
    {
        /// <summary>
        /// The reward identifier. 
        /// </summary>
        [Required]
        [JsonProperty("id")]
        [JsonPropertyName("id")]
        public string Id { get; init; } = default!;

        /// <summary>
        /// The reward name.
        /// </summary>
        [Required]
        [JsonProperty("title")]
        [JsonPropertyName("title")]
        public string Title { get; init; } = default!;

        /// <summary>
        /// The reward cost.
        /// </summary>
        [Required]
        [JsonProperty("cost")]
        [JsonPropertyName("cost")]
        public int Cost { get; init; } = default!;

        /// <summary>
        /// The reward description.
        /// </summary>
        [Required]
        [JsonProperty("prompt")]
        [JsonPropertyName("prompt")]
        public string Prompt { get; init; } = default!;
    }

    public sealed class Transport
    {
        /// <summary>The transport method. <value>webhook</value></summary>
        [Required]
        [JsonProperty("method")]
        [JsonPropertyName("method")]
        public string Method { get; init; } = null!;

        /// <summary>The callback URL where the notification should be sent.</summary>
        [Required]
        [JsonProperty("callback")]
        [JsonPropertyName("callback")]
        public string Callback { get; init; } = null!;

        /// <summary>The secret used for verifying a signature.</summary>
        [JsonProperty("secret")]
        [JsonPropertyName("secret")]
        public string? Secret { get; init; }
    }
}
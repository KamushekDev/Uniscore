using System;

namespace CreScore.Events.Twitch.Contract
{
    public sealed class OrderEvent
    {
        public static OrderEvent Created(string source, string creatorId, string creatorName,
            string? externalId,
            string order, string ordererId, string ordererName, string orderedAt) =>
            new()
            {
                Source = source,
                ExternalCreatorId = creatorId,
                ExternalCreatorName = creatorName,
                ExternalId = externalId,
                Order = order,
                ExternalUserId = ordererId,
                ExternalUserName = ordererName,
                OrderedAt = DateTime.Parse(orderedAt),
                State = OrderState.Created,
                CancellationReason = null,
                ClosedAt = null
            };

        public string Source { get; init; } = default!;
        public string ExternalCreatorId { get; init; } = default!;
        public string ExternalCreatorName { get; init; } = default!;
        public string? ExternalId { get; init; }
        public string Order { get; init; } = default!;
        public string ExternalUserId { get; init; } = default!;
        public string ExternalUserName { get; set; } = default!;
        public DateTime OrderedAt { get; init; }
        public DateTime? ClosedAt { get; init; }
        public OrderState State { get; init; }
        public string? CancellationReason { get; init; }
    }

    public enum OrderState
    {
        Created = 1,
        Fulfilled,
        Canceled
    }
}
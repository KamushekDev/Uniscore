using System.Collections.Generic;

namespace CreScore.Events.Twitch.Clients.Twitch.Models
{
    public record GetSubscriptionsResponse(
        int Total,
        ICollection<GetSubscriptionsResponse.GetSubscriptionData> Data,
        int MaxTotalCost,
        int TotalCost,
        GetSubscriptionsResponse.GetSubscriptionPagination Pagination
    )
    {
        public record GetSubscriptionData(
            string Id,
            string Status,
            string Type,
            string Version,
            GetSubscriptionData.SubscriptionCondition Condition,
            string CreatedAt,
            GetSubscriptionData.SubscriptionTransport Transport,
            int Cost)
        {
            public record SubscriptionCondition(string BroadcasterUserId);

            public record SubscriptionTransport(string Method, string Callback);
        }

        public record GetSubscriptionPagination();
    }
}
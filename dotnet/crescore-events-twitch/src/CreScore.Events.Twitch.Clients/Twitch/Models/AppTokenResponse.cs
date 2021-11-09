using System.Collections.Generic;
using System.Text.Json.Serialization;
using Newtonsoft.Json;

namespace CreScore.Events.Twitch.Clients.Twitch.Models
{
    public class AppTokenResponse
    {
        [JsonProperty("access_token")]
        [JsonPropertyName("access_token")]
        public string AccessToken { get; init; } = default!;

        [JsonProperty("token_type")]
        [JsonPropertyName("token_type")]
        public string TokenType { get; init; } = "bearer";

        [JsonProperty("scope")]
        [JsonPropertyName("scope")]
        public ICollection<string> Score { get; init; } = default!;

        [JsonProperty("refresh_token")]
        [JsonPropertyName("refresh_token")]
        public string RefreshToken { get; init; } = default!;

        [JsonProperty("expires_in")]
        [JsonPropertyName("expires_in")]
        public long ExpiresIn { get; init; }
    }

    // {
    // "access_token": "<user access token>",
    // "refresh_token": "",
    // "expires_in": <number of seconds until the token expires>,
    // "scope": ["<your previously listed scope(s)>"],
    // "token_type": "bearer"
    // }
}
using System;
using System.Buffers;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using CreScore.Events.Twitch.Attributes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using CreScore.Events.Twitch.Clients.Twitch;

namespace CreScore.Events.Twitch.Middlewares
{
    public class CheckSignatureMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<CheckSignatureMiddleware> _logger;

        public CheckSignatureMiddleware(RequestDelegate next, ILogger<CheckSignatureMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context, IOptionsSnapshot<TwitchOptions> twitchOptions)
        {
            if (IsNeeded(context))
            {
                context.Request.EnableBuffering();

                var (id, timestamp, signature) = GetFromHeaders(context);

                var buffer = ArrayPool<byte>.Shared.Rent(4 * 1024);

                var written = Encoding.UTF8.GetBytes(id + timestamp, buffer);

                context.Request.Body.Position = 0;
                var read = await context.Request.Body.ReadAsync(buffer.AsMemory(written));

                Debug.Assert(read + written < buffer.Length);

                var hasher = new HMACSHA256(Encoding.UTF8.GetBytes(twitchOptions.Value.SubscriptionsSecret));

                var hashBytes = hasher.ComputeHash(buffer, 0, read + written);

                var hash = BitConverter.ToString(hashBytes).Replace("-", "");

                if ("sha256=" + hash.ToLower() != signature)
                {
                    context.Response.StatusCode = StatusCodes.Status400BadRequest;
                    await context.Response.CompleteAsync();
                    _logger.LogWarning("Signature verification failed for message with id: {MessageId}", id);
                    return;
                }

                ArrayPool<byte>.Shared.Return(buffer);
                context.Request.Body.Position = 0;
                _logger.LogDebug("Signature verified for message with id: {MessageId}", id);
            }

            await _next(context);
        }

        private bool IsNeeded(HttpContext context)
        {
            var endpoint = context.Features.Get<IEndpointFeature>()?.Endpoint;
            var attribute = endpoint?.Metadata.GetMetadata<CheckSignatureAttribute>();
            return attribute != null;
        }

        private (string id, string timestamp, string signature) GetFromHeaders(HttpContext context)
        {
            var id = context.Request.Headers["Twitch-Eventsub-Message-Id"];
            var timestamp = context.Request.Headers["Twitch-Eventsub-Message-Timestamp"];
            var signature = context.Request.Headers["Twitch-Eventsub-Message-Signature"];
            return (id, timestamp, signature);
        }
    }
}
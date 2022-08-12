using Grpc.Core;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;

namespace Uniscore.Auth.Provider.ContextMetadata;

public sealed class ContextMetadataExtractor : IContextMetadataExtractor
{
    public string? GetUserId(ServerCallContext context)
    {
        return GetUserId(context.GetHttpContext());
    }

    public string? GetUserId(HttpContext context)
    {
        var authResult = context.Features.Get<IAuthenticateResultFeature>();
        var currentUserId = authResult?.AuthenticateResult?.Principal?.Identity?.Name!;

        return currentUserId;
    }
}
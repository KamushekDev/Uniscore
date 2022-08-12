using Grpc.Core;
using Microsoft.AspNetCore.Http;

namespace Uniscore.Auth.Provider.ContextMetadata;

public interface IContextMetadataExtractor
{
    string? GetUserId(ServerCallContext context);
    string? GetUserId(HttpContext context);
}
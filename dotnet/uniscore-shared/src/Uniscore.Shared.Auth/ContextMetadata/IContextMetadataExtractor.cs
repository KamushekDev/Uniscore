using System.Security.Claims;

namespace Uniscore.Shared.Auth.ContextMetadata;

public interface IContextMetadataExtractor
{
    string? GetUserIdOrDefault(ClaimsPrincipal claims);
    string GetUserId(ClaimsPrincipal claims);
    string? GetFirebaseInfoOrDefault(ClaimsPrincipal claims);
    string GetFirebaseInfo(ClaimsPrincipal claims);
    string? GetClaimByTypeOrDefault(ClaimsPrincipal claims, string claimType);
}
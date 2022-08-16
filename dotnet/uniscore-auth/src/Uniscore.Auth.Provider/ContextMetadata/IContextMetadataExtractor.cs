using System.Security.Claims;

namespace Uniscore.Auth.Provider.ContextMetadata;

public interface IContextMetadataExtractor
{
    string? GetUserIdOrDefault(ClaimsPrincipal claims);
    string GetUserId(ClaimsPrincipal claims);
    string? GetFirebaseInfoOrDefault(ClaimsPrincipal claims);
    string GetFirebaseInfo(ClaimsPrincipal claims);
    string? GetClaimByTypeOrDefault(ClaimsPrincipal claims, string claimType);
}
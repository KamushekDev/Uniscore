using System.Security.Claims;

namespace Uniscore.Shared.Auth.ContextMetadata;

public sealed class ContextMetadataExtractor : IContextMetadataExtractor
{
    public const string UserIdClaimType = ClaimTypes.NameIdentifier;
    public const string FirebaseClaimType = "firebase";


    public string? GetUserIdOrDefault(ClaimsPrincipal claims) =>
        GetClaimByTypeOrDefault(claims, UserIdClaimType);

    public string GetUserId(ClaimsPrincipal claims) =>
        GetUserIdOrDefault(claims) ?? throw GetNotExistingClaimException(UserIdClaimType);

    public string? GetFirebaseInfoOrDefault(ClaimsPrincipal claims) =>
        GetClaimByTypeOrDefault(claims, FirebaseClaimType);

    public string GetFirebaseInfo(ClaimsPrincipal claims) =>
        GetFirebaseInfoOrDefault(claims) ?? throw GetNotExistingClaimException(FirebaseClaimType);

    public string? GetClaimByTypeOrDefault(ClaimsPrincipal claims, string claimType)
    {
        return claims.Claims.FirstOrDefault(x => x.Type == claimType)?.Value;
    }

    private Exception GetNotExistingClaimException(string claimType)
    {
        return new InvalidOperationException($"User doesn't have {claimType} claim");
    }
}
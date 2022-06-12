namespace Uniscore.Auth.Core.Models;

public record TokenInfo(
    string UserId,
    string? Issuer,
    string? Subject,
    string? Audience,
    string? TenantId
);
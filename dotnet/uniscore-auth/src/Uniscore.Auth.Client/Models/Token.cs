namespace CreScore.Auth.Client.Models;

public record Token(
    string UserId,
    string? Issuer,
    string? Subject,
    string? Audience,
    string? TenantId
);
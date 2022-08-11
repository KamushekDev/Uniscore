namespace Uniscore.Auth.Infrastructure.Options;

public class UniscoreAuthorizationOptions
{
    public AuthorizationStatus Status { get; init; } = AuthorizationStatus.Enabled;
}

public enum AuthorizationStatus
{
    Enabled,
    EnabledOnPod,
    Disabled,
    DisabledOnDevelopment,
}
namespace Uniscore.Auth.Provider.Options;

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
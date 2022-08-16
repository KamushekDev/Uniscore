namespace Uniscore.Auth.Provider.Options;

public class UniscoreAuthorizationOptions
{
    public AuthorizationStatus Status { get; set; } = AuthorizationStatus.Enabled;
}

public enum AuthorizationStatus
{
    Enabled,
    EnabledOnPod,
    Disabled,
    DisabledOnDevelopment,
}
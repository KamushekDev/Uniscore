namespace Uniscore.Auth.Provider.Options;

public class UniscoreAuthorizationOptions
{
    public AuthorizationStatus Status { get; set; } = AuthorizationStatus.Enabled;

    public Uri AuthServiceUri { get; set; } = new Uri("http://auth-service.uniscore:82");
}

public enum AuthorizationStatus
{
    Enabled,
    EnabledOnPod,
    Disabled,
    DisabledOnDevelopment,
}
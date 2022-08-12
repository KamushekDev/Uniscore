namespace Uniscore.Auth.Provider.Options;

public class UniscoreAuthorizationOptions
{
    public AuthorizationStatus Status { get; init; } = AuthorizationStatus.Enabled;

    public Uri AuthServiceUri { get; init; } = new Uri("http://auth-service.uniscore:82");
}

public enum AuthorizationStatus
{
    Enabled,
    EnabledOnPod,
    Disabled,
    DisabledOnDevelopment,
}
namespace Uniscore.Users.Client.Errors;

public sealed class GetUserError
{
    public ErrorCode Code { get; init; }
    
    public string ErrorMessage { get; init; }

    public enum ErrorCode
    {
        NotFound
    }
}
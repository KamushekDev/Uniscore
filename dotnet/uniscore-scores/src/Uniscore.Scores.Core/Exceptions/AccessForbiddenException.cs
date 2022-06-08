namespace CreScore.Scores.Core.Exceptions;

public class AccessForbiddenException : DomainException
{
    public AccessForbiddenException(string? userId = null) : base($"Access forbidden for user: {userId}")
    {
        
    }
}
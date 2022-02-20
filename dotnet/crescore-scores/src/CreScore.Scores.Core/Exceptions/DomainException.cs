using System;

namespace CreScore.Scores.Core.Exceptions
{
    public class DomainException : Exception
    {
        public DomainException(string message, Exception? exception = null) { }
    }
}
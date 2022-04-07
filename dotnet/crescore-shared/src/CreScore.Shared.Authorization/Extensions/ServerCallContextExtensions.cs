using System.Security.Claims;
using Grpc.Core;

namespace CreScore.Shared.Authorization;

public static class ServerCallContextExtensions
{
    public static ClaimsIdentity? GetClaims(this ServerCallContext context, bool shouldThrow = true)
    {
        var identity = context.GetHttpContext().User.Identities
            .FirstOrDefault(x => x.AuthenticationType == Schemes.CreScoreScheme && x.IsAuthenticated);
        if (identity is null && shouldThrow)
            throw new Exception("User identity isn't presented in user data.");

        return identity;
    }
}
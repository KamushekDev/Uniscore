using CreScore.Scores.Core;
using FirebaseAdmin.Auth;

namespace CreScore.Scores.Infrastructure.Firebase;

public static class FirebaseTokenExtensions
{
    public static AuthInfo ToAuthInfo(this FirebaseToken firebaseToken)
    {
        return new AuthInfo(firebaseToken.Uid);
    }
}
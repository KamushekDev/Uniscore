using System;
using CreScore.Scores.Core;
using CreScore.Scores.Grpc.Interceptors;
using Grpc.Core;

namespace CreScore.Scores.Extensions;

public static class ServerCallContextExtensions
{
    //todo: ну эту хуету нужно нормально написать, как и сам интерсептор
    public static AuthInfo GetUserToken(this ServerCallContext context)
    {
        var success = context.UserState.TryGetValue(FirebaseAuthInterceptor.AuthHeaderName, out var state);
        if (success && state is AuthInfo info)
            return info;

        throw new UnauthorizedAccessException();
    }

    public static void SetAuthInfo(this ServerCallContext context, AuthInfo info)
    {
        context.UserState.Add(FirebaseAuthInterceptor.AuthHeaderName, info);
    }
}
using System;
using System.Threading.Tasks;
using CreScore.Scores.Core;
using CreScore.Scores.Extensions;
using CreScore.Scores.Infrastructure.Firebase;
using Grpc.Core;
using Grpc.Core.Interceptors;

namespace CreScore.Scores.Grpc.Interceptors;

public class FirebaseAuthInterceptor : Interceptor
{
    private readonly IAuthService _authService;
    public const string AuthHeaderName = "authorization";

    public FirebaseAuthInterceptor(IAuthService authService)
    {
        _authService = authService;
    }

    public override async Task<TResponse> UnaryServerHandler<TRequest, TResponse>(TRequest request,
        ServerCallContext context,
        UnaryServerMethod<TRequest, TResponse> continuation)
    {
        try
        {
            var auth = context.RequestHeaders.Get(AuthHeaderName);
#if DEBUG
            if (auth?.Value == "debug")
            {
                context.SetAuthInfo(AuthInfo.TestUser);
                return await base.UnaryServerHandler(request, context, continuation);
            }
#endif
            var firebaseToken = await _authService.AuthToken(auth?.Value, context.CancellationToken);
            var info = firebaseToken?.ToAuthInfo();

            if (info is null)
                throw new RpcException(new Status(StatusCode.Unauthenticated, "Firebase token wasn't authenticated"));
            else
                context.SetAuthInfo(info);

            return await base.UnaryServerHandler(request, context, continuation);
        }
        catch (ArgumentException ex)
        {
            var status = new Status(StatusCode.InvalidArgument, ex.Message);
            throw new RpcException(status);
        }
        catch (Exception ex)
        {
            var status = new Status(StatusCode.Internal, ex.Message);
            throw new RpcException(status);
        }
    }
}
using Grpc.Core;
using Grpc.Core.Interceptors;

namespace CreScore.Auth.Helper.Interceptors;

public class GrpcTokenPassthroughInterceptor : Interceptor
{
    private readonly ITokenStore _store;

    public GrpcTokenPassthroughInterceptor(ITokenStore store)
    {
        _store = store;
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        if (_store.IsTokenSet)
            context.Options.Headers?.Add(Constants.AuthorizationHeaderName, _store.GetToken()!);
        
        return base.AsyncUnaryCall(request, context, continuation);
    }
}
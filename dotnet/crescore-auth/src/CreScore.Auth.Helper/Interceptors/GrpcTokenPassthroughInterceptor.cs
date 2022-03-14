using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.Extensions.Logging;

namespace CreScore.Auth.Helper.Interceptors;

public class GrpcTokenPassthroughInterceptor : Interceptor
{
    private readonly ITokenStore _store;
    private readonly ILogger<GrpcTokenPassthroughInterceptor> _logger;

    public GrpcTokenPassthroughInterceptor(ITokenStore store, ILogger<GrpcTokenPassthroughInterceptor> logger)
    {
        _store = store;
        _logger = logger;
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        if (_store.IsTokenSet)
            context.Options.Headers?.Add(Constants.AuthorizationHeaderName, _store.GetToken()!);
        else
            _logger.LogWarning("Token for a request wasn't set");
        
        return base.AsyncUnaryCall(request, context, continuation);
    }
}
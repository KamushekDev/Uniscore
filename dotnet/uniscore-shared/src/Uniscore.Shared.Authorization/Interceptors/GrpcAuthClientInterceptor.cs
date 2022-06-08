using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.Extensions.Logging;

namespace CreScore.Shared.Authorization.Interceptors;

public class GrpcAuthClientInterceptor : Interceptor
{
    private readonly ITokenStore _store;
    private readonly ILogger<GrpcAuthClientInterceptor> _logger;

    public GrpcAuthClientInterceptor(ITokenStore store, ILogger<GrpcAuthClientInterceptor> logger)
    {
        _store = store;
        _logger = logger;
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        if (_store.IsTokenSet)
            context.Options.Headers?.Add(Schemes.AuthorizationHeaderName, _store.GetToken()!);
        else
            _logger.LogWarning("Token for a request wasn't set");

        return base.AsyncUnaryCall(request, context, continuation);
    }
}
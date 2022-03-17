using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.Extensions.Logging;

namespace CreScore.Shared.Authorization.Interceptors;

public class GrpcAuthServerInterceptor : Interceptor
{
    private readonly ITokenStore _store;
    private readonly ILogger<GrpcAuthServerInterceptor> _logger;

    public GrpcAuthServerInterceptor(ITokenStore store, ILogger<GrpcAuthServerInterceptor> logger)
    {
        _store = store;
        _logger = logger;
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        if (_store.IsTokenSet)
            _logger.LogWarning("Token for a request was already set");
        else
        {
            var token = context.Options.Headers?.GetValue(AuthConstants.AuthorizationHeaderName);

            if (token is null)
                _logger.LogWarning("Token for a request wasn't provided by the client");
            else
                _store.SetToken(token);
        }

        return base.AsyncUnaryCall(request, context, continuation);
    }
}
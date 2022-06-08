using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.Extensions.Logging;

namespace Uniscore.Auth.Provider.Interceptors;

public class GrpcAuthServerInterceptor : Interceptor
{
    private readonly ITokenStore _store;
    private readonly ILogger<GrpcAuthServerInterceptor> _logger;

    public GrpcAuthServerInterceptor(ITokenStore store, ILogger<GrpcAuthServerInterceptor> logger)
    {
        _store = store;
        _logger = logger;
    }

    private void SetTokenIfProvided(Metadata? headers)
    {
        if (_store.IsTokenSet)
            _logger.LogWarning("Token for a request was already set");
        else
        {
            var token = headers?.GetValue(Schemes.AuthorizationHeaderName);

            if (token is null)
                _logger.LogWarning("Token for a request wasn't provided by the client");
            else
                _store.SetToken(token);
        }
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.Options.Headers);
        return base.AsyncUnaryCall(request, context, continuation);
    }

    public override Task<TResponse> UnaryServerHandler<TRequest, TResponse>(TRequest request, ServerCallContext context,
        UnaryServerMethod<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.RequestHeaders);
        return base.UnaryServerHandler(request, context, continuation);
    }
}
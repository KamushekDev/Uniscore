using Grpc.Core;
using Grpc.Core.Interceptors;
using Microsoft.Extensions.Logging;
using Uniscore.Shared.Auth.AuthStore;

namespace Uniscore.Shared.Auth.Interceptors;

public class GrpcAuthInterceptor : Interceptor
{
    private readonly IAuthStore _store;
    private readonly ILogger<GrpcAuthInterceptor> _logger;

    public GrpcAuthInterceptor(IAuthStore store, ILogger<GrpcAuthInterceptor> logger)
    {
        _store = store;
        _logger = logger;
    }

    #region Client

    private void AddAuthorizationIfSet(Metadata? headers)
    {
        if (_store.IsTokenSet)
            headers?.Add(Constants.AuthorizationHeader, _store.GetToken()!);
        else
            _logger.LogWarning("Token for a request wasn't set");
    }

    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        AddAuthorizationIfSet(context.Options.Headers);
        return base.AsyncUnaryCall(request, context, continuation);
    }

    public override TResponse BlockingUnaryCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        BlockingUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        AddAuthorizationIfSet(context.Options.Headers);
        return base.BlockingUnaryCall(request, context, continuation);
    }

    public override AsyncClientStreamingCall<TRequest, TResponse> AsyncClientStreamingCall<TRequest, TResponse>(
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncClientStreamingCallContinuation<TRequest, TResponse> continuation)
    {
        AddAuthorizationIfSet(context.Options.Headers);
        return base.AsyncClientStreamingCall(context, continuation);
    }

    public override AsyncDuplexStreamingCall<TRequest, TResponse> AsyncDuplexStreamingCall<TRequest, TResponse>(
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncDuplexStreamingCallContinuation<TRequest, TResponse> continuation)
    {
        AddAuthorizationIfSet(context.Options.Headers);
        return base.AsyncDuplexStreamingCall(context, continuation);
    }

    public override AsyncServerStreamingCall<TResponse> AsyncServerStreamingCall<TRequest, TResponse>(TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncServerStreamingCallContinuation<TRequest, TResponse> continuation)
    {
        AddAuthorizationIfSet(context.Options.Headers);
        return base.AsyncServerStreamingCall(request, context, continuation);
    }

    #endregion

    #region Server

    private void SetTokenIfProvided(Metadata? headers)
    {
        if (_store.IsTokenSet)
            _logger.LogWarning("Token for a request was already set");
        else
        {
            var authHeaderValue = headers?.Get(Constants.AuthorizationHeader)?.Value;

            if (authHeaderValue is null)
                _logger.LogWarning("Token for a request wasn't provided by the client");
            else
                _store.SetAuthorization(authHeaderValue);
        }
    }

    public override Task<TResponse> UnaryServerHandler<TRequest, TResponse>(TRequest request, ServerCallContext context,
        UnaryServerMethod<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.RequestHeaders);
        return base.UnaryServerHandler(request, context, continuation);
    }

    public override Task<TResponse> ClientStreamingServerHandler<TRequest, TResponse>(
        IAsyncStreamReader<TRequest> requestStream, ServerCallContext context,
        ClientStreamingServerMethod<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.RequestHeaders);
        return base.ClientStreamingServerHandler(requestStream, context, continuation);
    }

    public override Task DuplexStreamingServerHandler<TRequest, TResponse>(IAsyncStreamReader<TRequest> requestStream,
        IServerStreamWriter<TResponse> responseStream, ServerCallContext context,
        DuplexStreamingServerMethod<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.RequestHeaders);
        return base.DuplexStreamingServerHandler(requestStream, responseStream, context, continuation);
    }

    public override Task ServerStreamingServerHandler<TRequest, TResponse>(TRequest request,
        IServerStreamWriter<TResponse> responseStream,
        ServerCallContext context, ServerStreamingServerMethod<TRequest, TResponse> continuation)
    {
        SetTokenIfProvided(context.RequestHeaders);
        return base.ServerStreamingServerHandler(request, responseStream, context, continuation);
    }

    #endregion
}
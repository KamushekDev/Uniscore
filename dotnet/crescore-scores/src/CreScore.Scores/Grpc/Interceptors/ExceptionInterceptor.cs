using System;
using System.Threading.Tasks;
using Grpc.Core;
using Grpc.Core.Interceptors;

namespace CreScore.Scores.Grpc.Interceptors
{
    public class ExceptionInterceptor : Interceptor
    {
        public override async Task<TResponse> UnaryServerHandler<TRequest, TResponse>(TRequest request,
            ServerCallContext context,
            UnaryServerMethod<TRequest, TResponse> continuation)
        {
            try
            {
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
}
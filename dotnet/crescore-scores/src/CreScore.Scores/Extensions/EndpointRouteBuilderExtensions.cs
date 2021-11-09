using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;

namespace CreScore.Scores.Extensions
{
    public static class EndpointRouteBuilderExtensions
    {
        public static IEndpointConventionBuilder MapHealthChecksWithCancellationSuppression(
            this IEndpointRouteBuilder endpoints, string pattern, HealthCheckOptions options)
        {
            // This is more or less a copy of HealthCheckEndpointRouteBuilderExtensions.MapHealthChecksCore - source: https://source.dot.net/#Microsoft.AspNetCore.Diagnostics.HealthChecks/Builder/HealthCheckEndpointRouteBuilderExtensions.cs,12465841a38c75e2,references

            // HealthCheckMiddleware uses HttpContext.RequestAborted as CancellationToken when calling HealthCheckService.
            // If client making the HTTP request to a HealthCheck endpoint cancels request before receiving a response, a TaskCanceledException will propagate through middlewares
            // and eventually be logged by Microsoft.AspNetCore.Server.Kestrel as an ERROR.   

            var args = options != null
                ? new[] { Microsoft.Extensions.Options.Options.Create(options) }
                : Array.Empty<object>();

            var pipeline = endpoints.CreateApplicationBuilder()
                .UseMiddleware<
                    CancellationSuppressionMiddleware>() // We have added this to suppress cancellations coming from HealthCheckMiddleware
                .UseMiddleware<HealthCheckMiddleware>(args)
                .Build();

            return endpoints.Map(pattern, pipeline).WithDisplayName("Health checks");
        }


        /// <summary>
        /// This middleware will catch any cancellation exceptions (OperationCanceledException or TaskCanceledException), and return 204 No Content.
        /// </summary>
        internal class CancellationSuppressionMiddleware
        {
            private readonly RequestDelegate _next;

            public CancellationSuppressionMiddleware(RequestDelegate next)
            {
                _next = next;
            }

            public async Task InvokeAsync(HttpContext httpContext)
            {
                try
                {
                    // Forward to next middleware
                    await _next(httpContext);
                }
                catch (OperationCanceledException)
                {
                    if (httpContext.Response.HasStarted) return;

                    // Set a status code. Response will likely not be seen by client as we expect all cancellations to come from httpContext.RequestAborted
                    // Why 204 No Content? I could not find any other appropriate status code.
                    httpContext.Response.StatusCode = StatusCodes.Status204NoContent;
                }
            }
        }
    }
}
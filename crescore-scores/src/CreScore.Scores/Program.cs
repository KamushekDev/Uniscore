using CreScore.Scores.Extensions;
using Crescore.Scores.Grpc;
using Crescore.Scores.Grpc.Interceptors;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(80, o => o.Protocols = HttpProtocols.Http1AndHttp2);
    options.ListenAnyIP(82, o => o.Protocols = HttpProtocols.Http2);
    options.ListenAnyIP(84, o => o.Protocols = HttpProtocols.Http1);
});

builder.Services.AddGrpc(options => { options.Interceptors.Add<ExceptionInterceptor>(); });

builder.Services.AddHealthChecks()
    .AddCheck("live", () => HealthCheckResult.Healthy("live"), tags: new[] { "live" })
    .AddCheck("health", () => HealthCheckResult.Healthy("health"), tags: new[] { "health" });

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();
app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<ScoreService>();
    endpoints.MapHealthChecksWithCancellationSuppression("/live", new HealthCheckOptions
    {
        Predicate = check => check.Tags.Contains("live")
    });
    endpoints.MapHealthChecksWithCancellationSuppression("/health", new HealthCheckOptions
    {
        Predicate = check => check.Tags.Contains("health")
    });
});

app.Run();
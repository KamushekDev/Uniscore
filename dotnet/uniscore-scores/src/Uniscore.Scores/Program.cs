using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using Prometheus;
using Prometheus.HttpMetrics;
using Uniscore.Auth.Provider.Extensions;
using Uniscore.Scores.Grpc;
using Uniscore.Scores.Grpc.Interceptors;
using Uniscore.Scores.Infrastructure;
using Uniscore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddUniscoreHealthChecks();

//configuration.GetSection(ServiceUrl.SectionName + ":auth").Get<ServiceUrl>()
builder.Services.AddUniscoreAuth(builder.Configuration);

builder.Services.AddCustomGrpc(options => { options.Interceptors.Add<ExceptionInterceptor>(); });

builder.Services.AddInfrastructure(builder.Configuration);


var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();
app.UseGrpcMetrics();
app.UseHttpMetrics();

app.UserCustomHealthChecks();

app.UseAuthentication();
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<ScoresService>();
    endpoints.MapGrpcService<GradesService>();

    endpoints.MapGrpcService<MetricsService>();

    endpoints.MapMetrics();
});

app.Run();
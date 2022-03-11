using CreScore.Auth.Helper;
using CreScore.Scores.Grpc;
using CreScore.Scores.Grpc.Interceptors;
using CreScore.Scores.Infrastructure;
using CreScore.Shared.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(80, o => o.Protocols = HttpProtocols.Http1AndHttp2);
    options.ListenAnyIP(82, o => o.Protocols = HttpProtocols.Http2);
    options.ListenAnyIP(84, o => o.Protocols = HttpProtocols.Http1);
});

builder.Services.AddCreScoreAuth(builder.Configuration);

builder.Services.AddGrpc(options =>
{
    options.AddCreScoreAuthInterceptors(builder.Configuration);
    options.Interceptors.Add<ExceptionInterceptor>();
    
});

builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddCreScoreHealthChecks();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<ScoresService>();
    endpoints.MapGrpcService<GradesService>();

    endpoints.MapCreScoreHealthChecks();
});

app.Run();
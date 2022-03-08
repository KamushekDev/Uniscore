using CreScore.Auth.Grpc;
using CreScore.Auth.Infrastructure;
using CreScore.Shared.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(80, o => o.Protocols = HttpProtocols.Http1AndHttp2);
    options.ListenAnyIP(82, o => o.Protocols = HttpProtocols.Http2);
    options.ListenAnyIP(84, o => o.Protocols = HttpProtocols.Http1);
});

builder.Services.AddGrpc();

builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddCreScoreHealthChecks();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();
app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<AuthorizationService>();

    endpoints.MapCreScoreHealthChecks();
});

app.Run();
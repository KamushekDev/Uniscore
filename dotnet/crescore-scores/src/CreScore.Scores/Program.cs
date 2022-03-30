using CreScore.Scores.Grpc;
using CreScore.Scores.Grpc.Interceptors;
using CreScore.Scores.Infrastructure;
using CreScore.Shared.Authorization;
using CreScore.Shared.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddCreScoreAuth(builder.Configuration);

builder.Services.AddCustomGrpc(options => { options.Interceptors.Add<ExceptionInterceptor>(); });

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
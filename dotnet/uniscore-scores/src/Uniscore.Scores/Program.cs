using CreScore.Scores.Grpc;
using CreScore.Scores.Grpc.Interceptors;
using CreScore.Scores.Infrastructure;
using CreScore.Shared.Authorization;
using CreScore.Shared.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddCreScoreHealthChecks();

builder.Services.AddCreScoreAuth(builder.Configuration);

builder.Services.AddCustomGrpc(options => { options.Interceptors.Add<ExceptionInterceptor>(); });

builder.Services.AddInfrastructure(builder.Configuration);


var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();

app.UserCustomHealthChecks();

app.UseAuthentication();
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<ScoresService>();
    endpoints.MapGrpcService<GradesService>();
});

app.Run();
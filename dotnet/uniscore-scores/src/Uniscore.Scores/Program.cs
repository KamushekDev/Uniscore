using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using Uniscore.Scores.Grpc;
using Uniscore.Scores.Infrastructure;
using Uniscore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureUniscoreKestrel(builder.Configuration);

builder.Services.AddInfrastructure(builder.Configuration, builder.Environment);

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseInfrastructure();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<ScoresService>();
    endpoints.MapGrpcService<GradesService>();
});

app.Run();
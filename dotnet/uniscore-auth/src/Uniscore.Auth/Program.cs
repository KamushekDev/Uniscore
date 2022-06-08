using CreScore.Auth.Grpc;
using CreScore.Auth.Infrastructure;
using CreScore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddGrpc();

builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddCreScoreHealthChecks();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();

app.UserCustomHealthChecks();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<AuthorizationService>();
});

app.Run();
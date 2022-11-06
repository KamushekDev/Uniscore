using Uniscore.BFF.Mobile.Grpc;
using Uniscore.BFF.Mobile.Infrastructure;
using Uniscore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureUniscoreKestrel(builder.Configuration);

builder.Services.AddInfrastructure(builder.Configuration, builder.Environment);

var app = builder.Build();

app.UseInfrastructure();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<BffService>();
});

app.Run();
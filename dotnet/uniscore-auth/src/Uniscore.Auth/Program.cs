using Uniscore.Auth.Grpc;
using Uniscore.Auth.Infrastructure;
using Uniscore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddGrpc();

builder.Services.AddInfrastructure(builder.Configuration);

var app = builder.Build();

if (app.Environment.IsDevelopment())
    app.UseDeveloperExceptionPage();

app.UseRouting();

app.UseInfrastructure();

app.UseEndpoints(endpoints => { endpoints.MapGrpcService<AuthorizationServiceApi>(); });

app.Run();
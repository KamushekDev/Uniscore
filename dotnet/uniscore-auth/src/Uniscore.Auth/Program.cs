using Uniscore.Auth.Grpc;
using Uniscore.Auth.Infrastructure;
using Uniscore.Auth.Services;
using Uniscore.Shared.Hosting;

var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddGrpc();

builder.Services.AddInfrastructure(builder.Configuration);
builder.Services.AddServices();


builder.Services.AddUniscoreHealthChecks();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseRouting();

app.UserCustomHealthChecks();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<AuthorizationServiceApi>();
    endpoints.MapGrpcService<UsersServiceApi>();
});

app.Run();
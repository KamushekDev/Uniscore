using Uniscore.Auth.Provider.Extensions;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Grpc;
using Uniscore.Users.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddUniscoreHealthChecks();

builder.Services.AddInfrastructure(builder.Configuration);

builder.Services.AddCustomGrpc(x => { });

var app = builder.Build();

app.UseRouting();

app.UserCustomHealthChecks();

app.UseAuthentication();
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapGrpcService<UsersServiceApi>();
});

app.Run();
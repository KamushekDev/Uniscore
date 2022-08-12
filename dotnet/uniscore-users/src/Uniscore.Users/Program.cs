using Uniscore.Auth.Provider.Extensions;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Grpc;
using Uniscore.Users.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureCustomKestrel(builder.Configuration);

builder.Services.AddInfrastructure(builder.Configuration, builder.Environment);

builder.Services.AddCustomGrpc(_ => { });

var app = builder.Build();

app.UseRouting();

app.UseInfrastructure();

app.UseEndpoints(endpoints => { endpoints.MapGrpcService<UsersServiceApi>(); });

app.Run();
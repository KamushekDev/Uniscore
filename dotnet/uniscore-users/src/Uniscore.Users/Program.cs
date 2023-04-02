using Uniscore.Shared.Hosting;
using Uniscore.Users.Grpc;
using Uniscore.Users.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureUniscoreKestrel(builder.Configuration);

builder.Services.AddInfrastructure(builder.Configuration, builder.Environment);

var app = builder.Build();

app.UseInfrastructure();

app.MapGrpcService<UsersServiceApi>();

app.Run();
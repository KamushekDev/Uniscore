using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using RestEase;
using CreScore.Events.Twitch;
using CreScore.Events.Twitch.Infrastructure.Clients;
using CreScore.Events.Twitch.Infrastructure.Database;
using CreScore.Events.Twitch.Infrastructure.Host;
using CreScore.Events.Twitch.Infrastructure.Kafka;
using CreScore.Events.Twitch.Middlewares;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddDatabase(builder.Configuration, builder.Environment);

if (builder.Environment.IsDevelopment())
{
    builder.Configuration.AddUserSecrets<MainAssemblyMarker>(true, true);
}

builder.Services.AddTwitchClient(builder.Configuration);
builder.Services.AddKafka(builder.Configuration);
builder.Services.AddHost(builder.Configuration);

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseExceptionHandler(c => c.Run(context =>
{
    var exception = context.Features.Get<IExceptionHandlerPathFeature>()!.Error;
    if (exception is ApiException apiException)
    {
        context.Response.StatusCode = (int)apiException.StatusCode;
        return context.Response.WriteAsJsonAsync(apiException.Content ?? apiException.Message);
    }

    return context.Response.WriteAsJsonAsync(exception.Message);
}));

app.UseMiddleware<CheckSignatureMiddleware>();

app.UseRouting();
app.MapControllers();

await app.RunAsync();
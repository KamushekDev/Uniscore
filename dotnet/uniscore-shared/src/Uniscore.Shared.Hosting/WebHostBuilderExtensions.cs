using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Uniscore.Shared.Common;

namespace Uniscore.Shared.Hosting;

public static class WebHostBuilderExtensions
{
    public static void ConfigureCustomKestrel(this IWebHostBuilder builder, IConfiguration configuration)
    {
        var ports = configuration.GetSection(ServicePorts.SectionName).Get<ServicePorts>() ??
                    new ServicePorts(80, 82, 84);

        builder.ConfigureKestrel(options =>
        {
            options.ListenAnyIP(ports.HttpPort, o => o.Protocols = HttpProtocols.Http1AndHttp2);
            options.ListenAnyIP(ports.GrpcPort, o => o.Protocols = HttpProtocols.Http2);
            options.ListenAnyIP(ports.DebugPort, o => o.Protocols = HttpProtocols.Http1AndHttp2);
        });
    }
}
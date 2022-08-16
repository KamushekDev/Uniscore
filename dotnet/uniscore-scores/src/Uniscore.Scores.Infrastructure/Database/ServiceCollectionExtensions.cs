using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Uniscore.Scores.Infrastructure.Options;

namespace Uniscore.Scores.Infrastructure.Database;

public static class ServiceCollectionExtensions
{
    public static void AddDatabase(this IServiceCollection sc, IConfiguration configuration)
    {
        sc.AddOptions<ConnectionOptions>()
            .Bind(configuration.GetSection(ConnectionOptions.SectionName));
        
        sc.AddDbContext<ScoresContext>((sp, options) =>
        {                                   
            var connectionOptions = sp.GetRequiredService<IOptionsSnapshot<ConnectionOptions>>().Value;
            options.UseNpgsql(connectionOptions.Database);
        });
    }
}
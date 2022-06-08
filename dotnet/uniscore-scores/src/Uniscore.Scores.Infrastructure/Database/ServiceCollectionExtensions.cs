using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Uniscore.Scores.Infrastructure.Options;

namespace Uniscore.Scores.Infrastructure.Database;

public static class ServiceCollectionExtensions
{
    public static void AddDatabase(this IServiceCollection sc)
    {
        sc.AddDbContext<ScoresContext>((sp, options) =>
        {                                   
            var connectionOptions = sp.GetRequiredService<IOptionsSnapshot<ConnectionOptions>>().Value;
            options.UseNpgsql(connectionOptions.Database);
        });
    }
}
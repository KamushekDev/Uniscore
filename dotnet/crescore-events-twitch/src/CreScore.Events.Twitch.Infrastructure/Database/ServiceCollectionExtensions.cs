using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace CreScore.Events.Twitch.Infrastructure.Database
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddDatabase(this IServiceCollection services, IConfiguration configuration,
            IHostEnvironment environment)
        {
            services.AddOptions<DatabaseOptions>()
                .Bind(configuration.GetSection(DatabaseOptions.OptionsName))
                .ValidateDataAnnotations();

            services.AddDbContext<TwitchEventsContext>((sp, options) =>
            {
                var opt = sp.GetRequiredService<IOptions<DatabaseOptions>>().Value;

                options.UseNpgsql(opt.ConnectionString);
                if (environment.IsDevelopment())
                {
                    options.EnableDetailedErrors();
                    options.EnableSensitiveDataLogging();
                }
            });

            return services;
        }
    }
}
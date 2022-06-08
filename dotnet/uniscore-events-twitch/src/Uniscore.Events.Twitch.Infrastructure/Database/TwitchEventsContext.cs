using Microsoft.EntityFrameworkCore;

namespace CreScore.Events.Twitch.Infrastructure.Database
{
    public class TwitchEventsContext : DbContext
    {
        public TwitchEventsContext(DbContextOptions options) : base(options)
        {
        }
    }
}
using System.ComponentModel.DataAnnotations;

namespace CreScore.Events.Twitch.Infrastructure.Database
{
    public class DatabaseOptions
    {
        public const string OptionsName = "DatabaseOptions";

        [Required]
        public string ConnectionString { get; init; }
    }
}
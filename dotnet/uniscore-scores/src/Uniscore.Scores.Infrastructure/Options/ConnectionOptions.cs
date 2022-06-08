namespace Uniscore.Scores.Infrastructure.Options;

public class ConnectionOptions
{
    public const string SectionName = "Connections";

    public string Database { get; set; } = "";
}
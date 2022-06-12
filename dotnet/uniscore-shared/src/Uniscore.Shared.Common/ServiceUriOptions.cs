namespace Uniscore.Shared.Common;

public record ServiceUriOptions(string Host, int Port)
{
    public const string SectionName = "ServiceUrls";

    private string? _uri;
    public string Uri => _uri ??= $"http://{Host}:{Port}";

    public ServiceUriOptions() : this("localhost", 82) { }
}
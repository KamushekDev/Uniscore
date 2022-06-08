namespace Uniscore.Shared.Common;

public record ServiceUrl(string Host, int Port)
{
    public const string SectionName = "ServiceUrls";

    private string? _uri;
    public string Uri => _uri ??= $"http://{Host}:{Port}";

    public ServiceUrl() : this("localhost", 82) { }
}
namespace CreScore.Shared.Common;

public class ServiceUriOptions
{
    public string Host { get; init; }
    public int Port { get; init; }

    private string? _uri;

    public string Uri => _uri ??= $"http://{Host}:{Port}";
}
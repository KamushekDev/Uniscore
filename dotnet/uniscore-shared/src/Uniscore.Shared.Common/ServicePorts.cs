namespace Uniscore.Shared.Common;

public record ServicePorts(
    int HttpPort,
    int GrpcPort,
    int DebugPort)
{
    public const string SectionName = "ServicePorts";

    public ServicePorts() : this(80, 82, 84) { }
};
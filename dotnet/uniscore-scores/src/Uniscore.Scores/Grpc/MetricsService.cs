using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;

namespace Uniscore.Scores.Grpc;

[AllowAnonymous]
public class MetricsService : MetricsApi.MetricsApiBase
{
    public MetricsService() { }

    
    public override Task<IncrementResponse> Increment(IncrementRequest request, ServerCallContext context)
    {
        return Task.FromResult(new IncrementResponse());
    }
}
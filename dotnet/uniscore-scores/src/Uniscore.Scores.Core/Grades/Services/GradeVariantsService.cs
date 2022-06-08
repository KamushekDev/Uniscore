using System.Threading;
using System.Threading.Tasks;
using CreScore.Scores.Core.Grades.Gateways;
using Microsoft.Extensions.Logging;

namespace CreScore.Scores.Core.Grades.Services;

public class GradeVariantsService
{
    private readonly IGradeVariantsGateway _gateway;
    private readonly ILogger<GradeVariantsService> _logger;

    public GradeVariantsService(IGradeVariantsGateway gateway, ILogger<GradeVariantsService> logger)
    {
        _gateway = gateway;
        _logger = logger;
    }

    public async Task<long> AddGradeVariant(string name, string ownerUserId, CancellationToken token)
    {
        var result = await _gateway.AddGradeVariant(name, ownerUserId, token);
        _logger.LogInformation(
            EventIds.AddGradeVariantEventId,
            "Created grade variant for user {UserId} with ID={Id}",
            ownerUserId,
            result.ToString()
        );
        return result;
    }
}
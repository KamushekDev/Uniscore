using System.Threading;
using System.Threading.Tasks;

namespace CreScore.Scores.Core.Grades.Gateways;

public interface IGradeVariantsGateway
{
    public Task<long> AddGradeVariant(string name, string ownerUserId, CancellationToken token);
}
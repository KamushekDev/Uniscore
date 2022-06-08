using System.Threading;
using System.Threading.Tasks;

namespace Uniscore.Scores.Core.Grades.Gateways;

public interface IGradeVariantsGateway
{
    public Task<long> AddGradeVariant(string name, string ownerUserId, CancellationToken token);
}
using System.Threading;
using System.Threading.Tasks;
using Uniscore.Scores.Core.Grades.Gateways;
using Uniscore.Scores.Infrastructure.Database;
using Uniscore.Scores.Infrastructure.Database.Models;

namespace Uniscore.Scores.Infrastructure.Grades;

public class GradeVariantsGateway : IGradeVariantsGateway
{
    private readonly ScoresContext _context;

    public GradeVariantsGateway(ScoresContext context)
    {
        _context = context;
    }

    public async Task<long> AddGradeVariant(string name, string ownerUserId, CancellationToken token)
    {
        var variant = new GradeVariants()
        {
            Name = name,
            OwnerUserId = ownerUserId
        };

        var result = _context.GradeVariants.Add(variant);

        await _context.SaveChangesAsync(token);

        return result.Entity.Id;
    }
}
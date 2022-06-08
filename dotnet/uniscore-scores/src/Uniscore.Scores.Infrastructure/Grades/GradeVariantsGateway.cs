using System.Threading;
using System.Threading.Tasks;
using CreScore.Scores.Core.Grades.Gateways;
using CreScore.Scores.Infrastructure.Database;
using CreScore.Scores.Infrastructure.Database.Models;

namespace CreScore.Scores.Infrastructure.Grades;

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

        var result = await _context.GradeVariants.AddAsync(variant, token);

        await _context.SaveChangesAsync(token);

        return result.Entity.Id;
    }
}
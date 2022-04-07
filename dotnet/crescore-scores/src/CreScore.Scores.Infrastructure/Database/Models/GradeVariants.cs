using System.Collections.Generic;

namespace CreScore.Scores.Infrastructure.Database.Models;

public class GradeVariants
{
    public long Id { get; init; }
    public string OwnerUserId { get; init; }
    public string Name { get; init; }
}
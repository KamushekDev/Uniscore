using CreScore.Scores.Infrastructure.Database.Models;
using Microsoft.EntityFrameworkCore;

namespace CreScore.Scores.Infrastructure.Database;

public class ScoresContext : DbContext
{
    public ScoresContext(DbContextOptions<ScoresContext> options) : base(options) { }

    public DbSet<GradesVariant> GradesVariants { get; set; }
}
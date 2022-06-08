using CreScore.Scores.Infrastructure.Database.Models;
using Microsoft.EntityFrameworkCore;

namespace CreScore.Scores.Infrastructure.Database;

public class ScoresContext : DbContext
{
    public ScoresContext(DbContextOptions<ScoresContext> options) : base(options) { }

    public DbSet<GradeVariants> GradeVariants { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(IInfrastructureAssembly).Assembly);
    }
}
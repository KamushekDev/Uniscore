using Microsoft.EntityFrameworkCore;
using Uniscore.Scores.Infrastructure.Database.Models;

namespace Uniscore.Scores.Infrastructure.Database;

public class ScoresContext : DbContext
{
    public ScoresContext(DbContextOptions<ScoresContext> options) : base(options) { }

    public DbSet<GradeVariants> GradeVariants { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(IInfrastructureAssembly).Assembly);
    }
}
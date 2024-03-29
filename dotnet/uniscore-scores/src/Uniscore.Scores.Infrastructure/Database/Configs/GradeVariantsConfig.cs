﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Uniscore.Scores.Infrastructure.Database.Models;

namespace Uniscore.Scores.Infrastructure.Database.Configs;

public class GradeVariantsConfig : IEntityTypeConfiguration<GradeVariants>
{
    public void Configure(EntityTypeBuilder<GradeVariants> builder)
    {
        builder.HasKey(x => x.Id);

        builder
            .Property(x => x.Id) 
            .IsRequired()
            .ValueGeneratedOnAdd();

        builder
            .Property(x => x.OwnerUserId)
            .IsRequired();

        builder
            .Property(x => x.Name)
            .IsRequired()
            .HasMaxLength(100);
    }
}
﻿using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Uniscore.Auth.Provider.Extensions;
using Uniscore.Auth.Provider.Options;
using Uniscore.Shared.Hosting;
using Uniscore.Users.Core.Users;
using Uniscore.Users.Infrastructure.Firebase;
using Uniscore.Users.Infrastructure.Users;

namespace Uniscore.Users.Infrastructure;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection sc,
        IConfiguration configuration,
        IWebHostEnvironment environment)
    {
        sc.AddUniscoreHealthChecks();

        sc.AddAuth(configuration, environment);

        sc.AddFirebase(configuration);

        sc.AddTransient<IUsersService, UsersService>();

        return sc;
    }

    private static void AddAuth(this IServiceCollection sc, IConfiguration configuration,
        IWebHostEnvironment environment)
    {
        var uriString = configuration.GetSection("AuthorizationServiceUri").Get<string>();

        
        var options = new UniscoreAuthorizationOptions()
        {
            Status = AuthorizationStatus.Enabled,
        };
        if (uriString is not null)
            options.AuthServiceUri = new Uri(uriString);

        sc.AddUniscoreAuth(configuration, environment, options: options);
    }
}
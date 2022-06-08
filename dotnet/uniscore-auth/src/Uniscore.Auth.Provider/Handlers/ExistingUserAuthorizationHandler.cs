using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;
using Uniscore.Auth.Client;
using Uniscore.Auth.Provider.Requirements;

namespace Uniscore.Auth.Provider.Handlers;

public class ExistingUserAuthorizationHandler : AuthorizationHandler<ExistingUserRequirement>
{
    private readonly IAuthGateway _gateway;
    private readonly ILogger<ExistingUserAuthorizationHandler> _logger;

    public ExistingUserAuthorizationHandler(IAuthGateway gateway, ILogger<ExistingUserAuthorizationHandler> logger)
    {
        _gateway = gateway;
        _logger = logger;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
        ExistingUserRequirement requirement)
    {
        context.Succeed(requirement);
        return Task.CompletedTask;
    }
}
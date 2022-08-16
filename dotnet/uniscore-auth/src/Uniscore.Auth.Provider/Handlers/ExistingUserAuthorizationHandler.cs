using Microsoft.AspNetCore.Authorization;
using Uniscore.Auth.Provider.ContextMetadata;
using Uniscore.Auth.Provider.Requirements;

namespace Uniscore.Auth.Provider.Handlers;

public class ExistingUserAuthorizationHandler : AuthorizationHandler<ExistingUserRequirement>
{
    private readonly IContextMetadataExtractor _extractor;

    public ExistingUserAuthorizationHandler(IContextMetadataExtractor extractor)
    {
        _extractor = extractor;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
        ExistingUserRequirement requirement)
    {
        var userId = _extractor.GetUserIdOrDefault(context.User);

        if (userId is not null)
            context.Succeed(requirement);
        else
            context.Fail(new AuthorizationFailureReason(this, "UserId wasn't provided"));
        return Task.CompletedTask;
    }
}
using Microsoft.AspNetCore.Authorization;
using Uniscore.Shared.Auth.ContextMetadata;
using Uniscore.Shared.Auth.Requirements;

namespace Uniscore.Shared.Auth.Handlers;

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
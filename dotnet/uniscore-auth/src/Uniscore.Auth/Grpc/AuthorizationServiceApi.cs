using Grpc.Core;
using Uniscore.Auth.Api;
using Uniscore.Auth.Core;

namespace Uniscore.Auth.Grpc;

public class AuthorizationServiceApi : AuthorizationApi.AuthorizationApiBase
{
    private readonly IAuthService _auth;
    private readonly ILogger<AuthorizationServiceApi> _logger;

    public AuthorizationServiceApi(IAuthService auth, ILogger<AuthorizationServiceApi> logger)
    {
        _auth = auth;
        _logger = logger;
    }

    public override async Task<AuthResponse> AuthorizeFirebaseToken(AuthRequest request, ServerCallContext context)
    {
        try
        {
            var result = await _auth.GetUserIdByToken(request.IdToken, context.CancellationToken);

            return new AuthResponse()
            {
                UserId = result.UserId,
                Audience = result.Audience,
                Issuer = result.Issuer,
                Subject = result.Subject,
                TenantId = result.TenantId
            };
        }
        catch (Exception e)
        {
            _logger.LogError(e, "Couldn't authenticate provided idToken");
            var status = new Status(StatusCode.Unauthenticated, e.Message);
            throw new RpcException(status);
        }
    }
}
using Grpc.Core;
using Uniscore.Auth.Core;

namespace Uniscore.Auth.Grpc;

public class AuthorizationService : AuthorizationApi.AuthorizationApiBase
{
    private readonly IAuthService _auth;
    private readonly ILogger<AuthorizationService> _logger;

    public AuthorizationService(IAuthService auth, ILogger<AuthorizationService> logger)
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

    public override async Task<GetFirebaseUserResponse> GetFirebaseUser(GetFirebaseUserRequest request,
        ServerCallContext context)
    {
        var result = await _auth.GetUserById(request.UserId, context.CancellationToken);

        if (result is null)
            throw new Exception("User wasn't found");

        var userInfo = new UserInfo()
        {
            Disable = result.Disabled,
            Uid = result.Uid,
            DisplayName = result.DisplayName,
            PhotoUrl = result.PhotoUrl,
            ProviderId = result.ProviderId,
            TenantId = result.TenantId,
            Email = result.ContactInfo.Email,
            EmailConfirmed = result.ContactInfo.EmailVerified,
            PhoneNumber = result.ContactInfo.PhoneNumber
        };

        return new GetFirebaseUserResponse()
        {
            Success = true, UserInfo = userInfo
        };
    }
}
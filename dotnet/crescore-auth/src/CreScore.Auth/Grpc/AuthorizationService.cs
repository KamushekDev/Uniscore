using CreScore.Auth.Core;
using Grpc.Core;

namespace CreScore.Auth.Grpc;

public class AuthorizationService : AuthorizationApi.AuthorizationApiBase
{
    private readonly IAuthService _auth;

    public AuthorizationService(IAuthService auth)
    {
        _auth = auth;
    }

    public override async Task<AuthResponse> AuthorizeFirebaseToken(AuthRequest request, ServerCallContext context)
    {
        var result = await _auth.GetUserIdByToken(request.IdToken, context.CancellationToken);

        return new AuthResponse() { Success = result != null, UserId = result };
    }

    public override async Task<GetFirebaseUserResponse> GetFirebaseUser(GetFirebaseUserRequest request,
        ServerCallContext context)
    {
        var result = await _auth.GetUserById(request.UserId, context.CancellationToken);

        if (result is null)
            throw new Exception("User wasn't found");
        
        var contactInfo = new UserInfo.Types.ContactInfo()
        {
            Email = result.ContactInfo.Email,
            EmailConfirmed = result.ContactInfo.EmailVerified,
            PhoneNumber = result.ContactInfo.PhoneNumber
        };

        var userInfo = new UserInfo()
        {
            Disable = result.Disabled,
            Uid = result.Uid,
            DisplayName = result.DisplayName,
            PhotoUrl = result.PhotoUrl,
            ProviderId = result.ProviderId,
            TenantId = result.TenantId,
            ContactInfo = contactInfo
        };

        return new GetFirebaseUserResponse()
        {
            Success = true, UserInfo = userInfo
        };
    }
}
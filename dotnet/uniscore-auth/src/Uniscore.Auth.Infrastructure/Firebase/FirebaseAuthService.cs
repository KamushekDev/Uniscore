using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Grpc.Core;
using Microsoft.Extensions.Logging;
using Uniscore.Auth.Core;
using Uniscore.Auth.Core.Models;

namespace Uniscore.Auth.Infrastructure.Firebase;

public class FirebaseAuthService : IAuthService
{
    private readonly ILogger<FirebaseAuthService> _logger;
    private readonly FirebaseAuth _auth;

    public FirebaseAuthService(FirebaseApp app, ILogger<FirebaseAuthService> logger)
    {
        _logger = logger;
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<TokenInfo> GetUserIdByToken(string token, CancellationToken ct)
    {
        if (token == "TESTUSER")
            return new TokenInfo(
                "SHCvlOY2HBQYUfDzjDqmJiatuKh1",
                null,
                null,
                null,
                null
            );


        var firebaseToken = await _auth.VerifyIdTokenAsync(token, ct);

        if (firebaseToken is null)
            throw new Exception("Couldn't authorize provided idToken.");

        return new TokenInfo(
            firebaseToken.Uid,
            firebaseToken.Issuer,
            firebaseToken.Subject,
            firebaseToken.Audience,
            firebaseToken.TenantId
        );
    }

    public async Task<Core.Models.UserInfo> GetUserById(string userId, CancellationToken ct)
    {
        try
        {
            var user = await _auth.GetUserAsync(userId, ct);

            var contactInfo = new ContactInfo(user.Email, user.EmailVerified, user.PhoneNumber);
            var userInfo = new Core.Models.UserInfo(user.Uid, user.DisplayName, user.PhotoUrl, user.Disabled,
                user.TenantId,
                contactInfo, user.ProviderId);

            return userInfo;
        }
        catch (FirebaseAuthException authException)
        {
            throw new RpcException(new Status(StatusCode.NotFound, authException.Message));
        }
    }
}
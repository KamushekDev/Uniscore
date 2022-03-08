using CreScore.Auth.Core;
using CreScore.Auth.Core.Models;
using Dawn;
using FirebaseAdmin;
using FirebaseAdmin.Auth;

namespace CreScore.Auth.Infrastructure.Firebase;

public class FirebaseAuthService : IAuthService
{
    private readonly FirebaseAuth _auth;

    public FirebaseAuthService(FirebaseApp app)
    {
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<Core.Models.UserInfo?> Authorize(string token, CancellationToken ct)
    {
        Guard.Argument(token, nameof(token)).NotNull().NotEmpty();

        var userId = await GetUserIdByToken(token, ct);

        if (userId == null)
            return null;

        var user = await GetUserById(userId, ct);

        return user;
    }

    public async Task<string?> GetUserIdByToken(string token, CancellationToken ct)
    {
        var firebaseToken = await _auth.VerifyIdTokenAsync(token, ct);

        return firebaseToken?.Uid;
    }

    public async Task<Core.Models.UserInfo?> GetUserById(string userId, CancellationToken ct)
    {
        var user = await _auth.GetUserAsync(userId, ct);

        var contactInfo = new ContactInfo(user.Email, user.EmailVerified, user.PhoneNumber);
        var userInfo = new Core.Models.UserInfo(user.Uid, user.DisplayName, user.PhotoUrl, user.Disabled, user.TenantId,
            contactInfo, user.ProviderId);

        return userInfo;
    }
}
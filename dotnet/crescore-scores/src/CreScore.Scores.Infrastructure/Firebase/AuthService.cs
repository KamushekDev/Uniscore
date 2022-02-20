using System.Threading;
using System.Threading.Tasks;
using Dawn;
using FirebaseAdmin;
using FirebaseAdmin.Auth;

namespace CreScore.Scores.Infrastructure.Firebase;

public class AuthService : IAuthService
{
    private readonly FirebaseAuth _auth;

    public AuthService(FirebaseApp app)
    {
        _auth = FirebaseAuth.GetAuth(app);
    }

    public async Task<FirebaseToken?> AuthToken(string? token, CancellationToken ct)
    {
        Guard.Argument(token, nameof(token)).NotNull().NotEmpty();

        return await _auth.VerifyIdTokenAsync(token, ct);
    }
}
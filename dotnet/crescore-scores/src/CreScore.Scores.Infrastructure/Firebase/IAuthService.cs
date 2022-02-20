using System.Threading;
using System.Threading.Tasks;
using FirebaseAdmin.Auth;

namespace CreScore.Scores.Infrastructure.Firebase;

public interface IAuthService
{
    Task<FirebaseToken?> AuthToken(string? token, CancellationToken ct);
}
using System.Threading.Tasks;
using CreScore.Events.Twitch.Clients.Twitch.Models;

namespace CreScore.Events.Twitch.Clients.Twitch
{
    public interface ITwitchAuthorizationService
    {
        Task<AppTokenResponse> GetAppAccessToken(string? scopeParam = null);
    }
}
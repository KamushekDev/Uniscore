using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Uniscore.Shared.Auth.ContextMetadata;

namespace Uniscore.BFF.Mobile.Grpc;

[Authorize]
public class BffService : MobileBffApi.MobileBffApiBase
{
    private readonly IContextMetadataExtractor _metadataExtractor;

    public BffService(IContextMetadataExtractor metadataExtractor)
    {
        _metadataExtractor = metadataExtractor;
    }

    private static int _followers = 1337;
    
    public override async Task<GetUserProfileResponse> GetUserProfile(GetUserProfileRequest request,
        ServerCallContext context)
    {
        var userId = _metadataExtractor.GetUserId(context.GetHttpContext().User);

        if (request.UserId is null || userId == request.UserId)
            return new GetUserProfileResponse()
            {
                SelfProfile = new GetUserProfileResponse.Types.SelfProfile()
                {
                    Followers = _followers++,
                    Following = 69,
                    Id = userId,
                    DisplayName = "KamushekDev",
                    PhotoUrl = $"https://thispersondoesnotexist.com/image?a={_followers}",
                    BackgroundPhotoUrl = null,
                    ProfileInformation =
                        "There's your profile information. Take it or leave it. Why are you still reading this, arrogant piece of shit.",
                    RecentGrades = { GenerateGrades(6) }
                }
            };

        return new GetUserProfileResponse()
        {
            OtherProfile = new GetUserProfileResponse.Types.OtherProfile()
            {
                Followers = _followers++,
                Following = 69,
                Id = request.UserId,
                DisplayName = "KamushekDev",
                PhotoUrl = $"https://thispersondoesnotexist.com/image?a={_followers}",
                BackgroundPhotoUrl = null,
                ProfileInformation =
                    "There's your profile information. Take it or leave it. Why are you still reading this, arrogant piece of shit.",
                RecentGrades = { GenerateGrades(6) },
                IsUserSubscribed = false,
                //IsSubscribedToUser = false
            }
        };

        ICollection<GetUserProfileResponse.Types.Grade> GenerateGrades(int count)
        {
            var grades = new List<GetUserProfileResponse.Types.Grade>();
            while (count-- > 0)
            {
                grades.Add(new GetUserProfileResponse.Types.Grade()
                {
                    Id = Guid.NewGuid().ToString(),
                    Name = "GradeName" + Guid.NewGuid(),
                    Type = "Game",
                    CreatedAt = Timestamp.FromDateTime(DateTime.Now.Subtract(TimeSpan.FromDays(count)).ToUniversalTime())
                });
            }

            return grades;
        }
    }

    public override Task<GetUserGradesResponse> GetUserGrades(GetUserGradesRequest request, ServerCallContext context)
    {
        return base.GetUserGrades(request, context);
    }
}
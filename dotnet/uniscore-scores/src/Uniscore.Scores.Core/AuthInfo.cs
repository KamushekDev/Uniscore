namespace Uniscore.Scores.Core;

public record AuthInfo(string UId)
{
    public static AuthInfo TestUser => new AuthInfo("LXgai0tkhShcmJPvWIl1ezvegXR2");
};
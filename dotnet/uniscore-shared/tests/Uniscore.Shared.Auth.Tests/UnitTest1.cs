namespace Uniscore.Shared.Auth.Tests;

public class UnitTest1
{
    [Fact(DisplayName = "Ну тут это, типо тест, ага, да")]
    public void Test1()
    {
        var store = new AuthStore.AuthStore();

        Assert.False(store.IsTokenSet);
        
        store.SetAuthorization("sdf");
        
        Assert.True(store.IsTokenSet);
        
        Assert.Equal("sdf", store.GetToken());
        
    }
}
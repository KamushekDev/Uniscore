using AutoFixture.Xunit2;
using Microsoft.AspNetCore.Mvc.Testing;

namespace Uniscore.Shared.IntegrationTests;

public class GrpcAuthInterceptorTests : IClassFixture<WebApplicationFactory<SampleService>>
{
    private readonly WebApplicationFactory<SampleService> _factory;

    public GrpcAuthInterceptorTests(WebApplicationFactory<SampleService> factory)
    {
        _factory = factory;
    }
    
    [Theory]
    [AutoData]
    public void Test1(string token)
    {
        // ARRANGE
        //var client = _factory.CreateClient();

        // ACT
        //client.

        // ASSERT
        
    }
}
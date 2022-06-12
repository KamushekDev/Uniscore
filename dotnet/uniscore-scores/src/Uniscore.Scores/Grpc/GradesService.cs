using System;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;
using Uniscore.Auth.Provider;
using Uniscore.Auth.Provider.Extensions;
using Uniscore.Scores.Core.Grades.Gateways;

namespace Uniscore.Scores.Grpc;

public class GradesService : GradesApi.GradesApiBase
{
    private readonly IGradeVariantsGateway _gateway;
    private readonly ILogger<GradesService> _logger;

    public GradesService(IGradeVariantsGateway gradeVariantsGateway, ILogger<GradesService> logger)
    {
        _gateway = gradeVariantsGateway;
        _logger = logger;
    }

    [Authorize(Policies.ValidUser)]
    public override async Task<AddGradeVariantResponse> AddGradeVariant(AddGradeVariantRequest request,
        ServerCallContext context)
    {
        var claims = context.GetClaims();
        _logger.LogInformation("Fake add grade was invoked with name: {Name}. User id: {UId}", request.Name, claims?.Name);

        
        return new AddGradeVariantResponse() { Id = -1 };
        
        // var ownerUser = context.GetUserToken();
        // if (ownerUser is null)
        //     throw new AccessForbiddenException();
        //
        // var variantName = request.Name;
        //
        //
        // var result = await _gateway.AddGradeVariant(variantName, ownerUser.UId, context.CancellationToken);
        //
        // var response = new AddGradeVariantResponse()
        // {
        //     Id = result
        // };
        //
        // return response;
    }

    public override async Task<GetGradeVariantResponse> GetGradeVariant(GetGradeVariantRequest request,
        ServerCallContext context)
    {
        throw new NotImplementedException();
    }
}
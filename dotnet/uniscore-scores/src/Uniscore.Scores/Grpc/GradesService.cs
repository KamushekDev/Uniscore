using System;
using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;
using Uniscore.Scores.Core.Grades.Gateways;
using Uniscore.Shared.Auth;
using Uniscore.Shared.Auth.ContextMetadata;

namespace Uniscore.Scores.Grpc;

public class GradesService : GradesApi.GradesApiBase
{
    private readonly IGradeVariantsGateway _gateway;
    private readonly ILogger<GradesService> _logger;
    private readonly IContextMetadataExtractor _extractor;

    public GradesService(IGradeVariantsGateway gradeVariantsGateway, ILogger<GradesService> logger,
        IContextMetadataExtractor extractor)
    {
        _gateway = gradeVariantsGateway;
        _logger = logger;
        _extractor = extractor;
    }

    [Authorize(Policies.ValidUser)]
    public override async Task<AddGradeVariantResponse> AddGradeVariant(AddGradeVariantRequest request,
        ServerCallContext context)
    {
        var userId = _extractor.GetUserId(context.GetHttpContext().User);
        _logger.LogInformation("Fake add grade was invoked with name: {Name}. User id: {UId}", request.Name,
            userId);


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
using System;
using System.Threading.Tasks;
using CreScore.Scores.Core.Exceptions;
using CreScore.Scores.Core.Grades.Gateways;
using CreScore.Scores.Extensions;
using Grpc.Core;

namespace CreScore.Scores.Grpc;

public class GradesService : GradesApi.GradesApiBase
{
    private readonly IGradeVariantsGateway _gateway;

    public GradesService(IGradeVariantsGateway gradeVariantsGateway)
    {
        _gateway = gradeVariantsGateway;
    }

    public override async Task<AddGradeVariantResponse> AddGradeVariant(AddGradeVariantRequest request,
        ServerCallContext context)
    {
        var ownerUser = context.GetUserToken();
        if (ownerUser is null)
            throw new AccessForbiddenException();

        var variantName = request.Name;


        var result = await _gateway.AddGradeVariant(variantName, ownerUser.UId, context.CancellationToken);

        var response = new AddGradeVariantResponse()
        {
            Id = result
        };

        return response;
    }

    public override async Task<GetGradeVariantResponse> GetGradeVariant(GetGradeVariantRequest request,
        ServerCallContext context)
    {
        throw new NotImplementedException();
    }
}
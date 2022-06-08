using Microsoft.Extensions.Logging;

namespace CreScore.Scores.Core;

public static class EventIds
{
    public static readonly EventId AddGradeVariantEventId = new EventId(1, nameof(AddGradeVariantEventId));
}
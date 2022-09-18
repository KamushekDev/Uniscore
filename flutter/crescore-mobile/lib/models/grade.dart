class Grade {
  final int id;
  final String name;
  final String? description;
  final int lowerBound;
  final int upperBound;
  final String userId;
  final double avgValue;
  final int confidence;
  final int gradeVariantId;

  Grade(this.id, this.gradeVariantId, this.name, this.description, this.lowerBound, this.upperBound, this.userId, this.avgValue,
      this.confidence);
}

class GradeVariant {
  GradeVariant(this.id, this.userId, this.grades) : gradesCount = grades.length;

  final int id;
  final List<Grade> grades;
  final int gradesCount;
  final String userId;
}

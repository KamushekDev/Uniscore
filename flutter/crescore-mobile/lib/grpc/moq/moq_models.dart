enum ContentType {
  game,
  movie,
}

class Grade {
  final int id;
  final String name;
  final String value;
  final GradeSystem gradeSystem;

  Grade(this.id, this.name, this.value, this.gradeSystem);
}

class GradeSystem {
  final int id;
  final String name;
  final int authorId;

  GradeSystem(this.id, this.name, this.authorId);
}

class GradedContent {
  final String contentName;
  final ContentType contentType;
  final DateTime dateTime;
  final User user;
  final String description;
  final List<Grade> grades;

  GradedContent(this.contentName, this.contentType, this.dateTime, this.user, this.description, this.grades);
}

class User {
  final int id;
  final String name;

  User(this.id, this.name);
}

class Helper {
  static String getContentTypeString(ContentType contentType) {
    switch (contentType) {
      case ContentType.game:
        return "Игра";
      case ContentType.movie:
        return "Кино";
      default:
        return "WTF";
    }
  }
}

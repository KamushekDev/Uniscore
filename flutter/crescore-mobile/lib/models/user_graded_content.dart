import 'package:crescore/models/grade.dart';
import 'package:crescore/models/user.dart';
import 'package:crescore/models/contentType.dart';

class UserGradedContent {
  final String name;
  final ContentType type;
  final Grade grade;
  final User user;

  UserGradedContent(this.name, this.type, this.grade, this.user);
}
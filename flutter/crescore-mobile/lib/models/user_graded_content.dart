import 'package:Uniscore/models/grade.dart';
import 'package:Uniscore/models/user.dart';
import 'package:Uniscore/models/contentType.dart';

class UserGradedContent {
  final String name;
  final ContentType type;
  final Grade grade;
  final User user;

  UserGradedContent(this.name, this.type, this.grade, this.user);
}
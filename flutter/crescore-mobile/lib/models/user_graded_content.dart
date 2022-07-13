import 'package:Uniscore/models/grade.dart';
import 'package:Uniscore/models/user.dart';
import 'package:Uniscore/models/contentType.dart';

class UserGradedContent {
  final int id;
  final String title;
  final ContentType type;
  final Grade grade;
  final User user;

  UserGradedContent(this.id, this.title, this.type, this.grade, this.user);
}
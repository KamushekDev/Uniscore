import 'package:crescore/grpc/moq/moq_models.dart';
import 'dart:math';

extension RandomListItem<T> on List<T> {
  T random() {
    return this[Random().nextInt(length)];
  }
}

class ScoresMoq {
  static const List<String> contentNames = [
    "Counter-Strike: Global Offensive",
    "DOTA 2",
    "Worms: Armageddon",
    "Казаки: Снова Война",
    "Borderlands",
  ];

  static const List<String> gradedContentDescriptions = [
    "Непонятно почему популярный когда-то кусок говна, в который сейчас деды играют потому что нехуй было блядь, да? ну и ещё какой-нибудь текст для полноты картины))",
    "Ну тут типа есть текст, чтобы много, но и не много в то же время, т.к. много уже есть в первом варианте",
    "Привет, я описание контента, крутое, да?",
    "Контент, которого достойны только короли! Лучшее что видело человечество!"
  ];

  static const List<String> userNames = [
    "Рома Жёлудь",
    "Какой-то чел",
    "Лох",
    "Хто я?",
  ];

  static const List<String> gradeValues = [
    "Нормуль",
    "Добро",
    "Лютый кал",
    "Зло",
  ];

  static const List<String> gradeSystemNames = [
    "Ваша шкала",
    "Типа шкала",
  ];

  static Grade createGrade() {
    return Grade(1, "-", gradeValues.random(),
        GradeSystem(1, gradeSystemNames.random(), 1));
  }

  static GradedContent createGradedContent() {
    var gradesCount = Random().nextInt(3)+1;
    var grades = <Grade>[];
    for (int i =0; i< gradesCount;i++){
      grades.add(createGrade());
    }

    return GradedContent(
      contentNames.random(),
      ContentType.game,
      DateTime.now(),
      User(1, userNames.random()),
      gradedContentDescriptions.random(),
      grades,
    );
  }

  Future<List<GradedContent>> getHomePageContent(int count) {
    var result = <GradedContent>[];

    for (int i = 0; i < count; i++) {
      result.add(createGradedContent());
    }

    return Future.delayed(
      const Duration(milliseconds: 457),
      () => result,
    );
  }

  Future<int> homeMethod() {
    return Future<int>.delayed(const Duration(milliseconds: 600), () => 1);
  }
}

import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/contentType.dart';
import 'package:Uniscore/models/gradable_content.dart';
import 'package:Uniscore/models/grade.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user.dart';
import 'dart:math';

import 'package:Uniscore/models/user_graded_content.dart';

extension RandomListItem<T> on List<T> {
  T random() {
    return this[Random().nextInt(length)];
  }
}

class BackendServiceMoq implements IBackendService {
  static const String _userId = "Kamushek";

  final List<GradeVariant> _gradeVariants = <GradeVariant>[
    GradeVariant(1, "ka", <Grade>[
      Grade(1, 1, "Никому не интересно", "Описание 1", 1, 20, _userId, (20 + 1) / 2.0, 20 - 1 + 1),
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      Grade(3, 1, "Играть можно", "Описание 3", 41, 60, _userId, (60 + 41) / 2.0, 60 - 41 + 1),
      Grade(4, 1, "Хорошая игра", "Описание 4", 61, 80, _userId, (80 + 61) / 2.0, 80 - 61 + 1),
      Grade(5, 1, "Игра шедевральна", "Описание 5", 81, 100, _userId, (100 + 81) / 2.0, 100 - 81 + 1),
    ])
  ];

  final List<UserGradedContent> _grades = <UserGradedContent>[
    UserGradedContent(
      1,
      "Test1",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      2,
      "Test2",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      3,
      "Test3",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      4,
      "Test4",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      5,
      "Test5",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      6,
      "Test6",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      7,
      "Test7",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      8,
      "Test8",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      9,
      "Test9",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      10,
      "Test10",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      11,
      "Test11",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      12,
      "Test12",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      13,
      "Test13",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(14,
      "Test14",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      15,
      "Test15",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      16,
      "Test16",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      17,
      "Test17",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      18,
      "Test18",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      19,
      "Test19",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      20,
      "Test20",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      21,
      "Test21",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
    UserGradedContent(
      22,
      "Test22",
      ContentType.Game,
      Grade(2, 1, "Мне не интересно", "Описание 2", 21, 40, _userId, (40 + 21) / 2.0, 40 - 21 + 1),
      User(_userId, "Kamushek"),
    ),
  ];

  @override
  Future<List<UserGradedContent>> getUserGrades(int offset, int length) {
    var content = _grades
        .where((element) => element.user.id == _userId)
        .skip(offset)
        .take(length)
        .toList();
    return Future.value(content);
  }

  @override
  Future<Profile> getProfile() async {
    throw Exception();

    //await Future.delayed(Duration(milliseconds: 100));
    // return Future.error("df");
    //return Future.value(Profile("Kamushek", 69, 1337));
  }

  @override
  Future loginEcho() {
    return Future.delayed(Duration.zero);
  }

  // static Grade createGrade() {
  //   return Grade(1, "-", gradeValues.random(),
  //       GradeSystem(1, gradeSystemNames.random(), 1));
  // }

  // static GradedContent createGradedContent() {
  //   var gradesCount = Random().nextInt(3)+1;
  //   var grades = <Grade>[];
  //   for (int i =0; i< gradesCount;i++){
  //     grades.add(createGrade());
  //   }
  //
  //   return GradedContent(
  //     contentNames.random(),
  //     ContentType.game,
  //     DateTime.now(),
  //     User(1, userNames.random()),
  //     gradedContentDescriptions.random(),
  //     grades,
  //   );
  // }

  // Future<List<GradedContent>> getHomePageContent(int count) {
  //   var result = <GradedContent>[];
  //
  //   for (int i = 0; i < count; i++) {
  //     result.add(createGradedContent());
  //   }
  //
  //   return Future.delayed(
  //     const Duration(milliseconds: 457),
  //         () => result,
  //   );
  // }

  Future<int> homeMethod() {
    return Future<int>.delayed(const Duration(milliseconds: 600), () => 1);
  }

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

  @override
  Future<GradableContent> getContent(int id) async {
    await Future.delayed(Duration(milliseconds: 300));

    var mini = _grades.firstWhere((element) => element.id == id);

    var desc = "Новое слово в нише канонизированных экшен-шутеров с упором на многопользовательский сегмент и непродолжительные повторяющиеся баталии. Первое, на что обращаешь внимание при знакомстве с игрой – это, конечно же графика. От 1.6 новая версия ушла значительно далеко, даже дальше чем CS Source. Косметические изменения скрываются в окне закупки, которую надо проводить перед каждым началом раунда. Меню приобретения оружия стало круглым, а каждое оружие обзавелось отображением характеристик.";

    return Future.value(GradableContent(mini.title, description: desc*mini.id));
  }
}

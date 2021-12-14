import 'package:crescore/generated/Scores.pb.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/pages/shared.dart';
import 'package:crescore/widgets/grade_widget.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GradesPage extends StatefulWidget {
  static const String routeName = '/grades';
  static const String name = 'Grades';

  const GradesPage({Key? key}) : super(key: key);

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  Widget onData(List<Grade> grades) {
    return ListView.builder(
      itemCount: grades.length,
      itemBuilder: (context, index) {
        return GradeWidget(grades[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FuturePage<List<Grade>>(
      Shared.appBar(GradesPage.name, context),
      GetIt.I.get<ScoresClient>().getGrades(35),
      (List<Grade> data) => onData(data),
    );
  }
}

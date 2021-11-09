import 'package:crescore/generated/Scores.pb.dart';
import 'package:flutter/material.dart';

class GradeWidget extends StatelessWidget {

  final Grade grade;

  const GradeWidget(this.grade, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(grade.name),
            const Spacer(),
            Text(grade.value.toString()),
          ],
        ),
      )
    );
  }

}
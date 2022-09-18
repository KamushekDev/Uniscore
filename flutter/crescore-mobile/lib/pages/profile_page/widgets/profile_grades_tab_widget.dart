import 'package:Uniscore/pages/profile_page/Models/profile_grades_tab_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_graded_content_widget.dart';
import 'package:Uniscore/widgets/graded_content_card.dart';
import 'package:flutter/material.dart';

class ProfileGradesTab extends StatelessWidget {
  final ProfileGradesTabModel _model;

  const ProfileGradesTab(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _model.grades.length,
        itemBuilder: (context, index) => ProfileGradedContent(_model.grades[index]),
      ),
    );
    // return FutureBuilder(
    //     future: _bs.getUserGrades(0, 10),
    //     builder: (context, snapshot) {
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           return const SomethingWrongWidget(message: "Connection state is none");
    //         case ConnectionState.waiting:
    //         case ConnectionState.active:
    //           return const Center(child: CircularProgressIndicator.adaptive());
    //         case ConnectionState.done:
    //           if (snapshot.hasError) {
    //             return SomethingWrongWidget(message: snapshot.error.toString());
    //           }
    //           if (snapshot.hasData) {
    //             return
    //           }
    //           break;
    //       }
    //       return const SomethingWrongWidget(message: "Connection state was unexpected");
    //     });
  }

}
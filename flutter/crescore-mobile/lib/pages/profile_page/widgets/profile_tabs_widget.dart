import 'package:Uniscore/pages/profile_page/Models/profile_grades_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_tabs_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_grade_variants_tab_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_grades_tab_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_information_tab_widget.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final ProfileTabsModel _model;

  const ProfileTabs(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: "Мои оценки"),
                Tab(text: "Инфо"),
                Tab(text: "Моя система"),
              ],
              labelColor: Theme.of(context).textTheme.bodyText1?.color,
              labelStyle: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: TabBarView(
                  children: [
                    ProfileGradesTab(ProfileGradesTabModel(_model.grades)),
                    const ProfileInformationTab(),
                    const ProfileGradeVariantsTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

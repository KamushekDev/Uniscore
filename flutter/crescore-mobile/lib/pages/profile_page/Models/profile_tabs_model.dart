import 'package:Uniscore/pages/profile_page/Models/profile_grade_variants_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_grades_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_information_tab_model.dart';

class ProfileTabsModel {
  ProfileTabsModel(this.gradesTab, this.informationTab, this.gradeVariantsTab);

  final ProfileGradesTabModel gradesTab;
  final ProfileInformationTabModel informationTab;
  final ProfileGradeVariantsTabModel gradeVariantsTab;
}

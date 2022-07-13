import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_grade_variants_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_grades_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_head_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_information_tab_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_stats_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_tabs_model.dart';
import 'package:tuple/tuple.dart';

class ProfileLandingModel {
  ProfileLandingModel.fromData(Tuple2<Profile, List<UserGradedContent>> data)
      : this.profileInformation = "Your information, you selfish piece of shit!",
        this.profileHead = ProfileHeadModel("Lamushek", null),
        this.profileStats = ProfileStatsModel(1337, 69),
        this.profileTabs = ProfileTabsModel(
          ProfileGradesTabModel(data.item2),
          ProfileInformationTabModel("Your information, you selfish piece of shit!"),
          ProfileGradeVariantsTabModel(),
        );

  final String profileInformation;

  final ProfileHeadModel profileHead;
  final ProfileStatsModel profileStats;
  final ProfileTabsModel profileTabs;
}

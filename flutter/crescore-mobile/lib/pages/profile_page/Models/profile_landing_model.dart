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
      : this.profileHead = ProfileHeadModel(data.item1.username, data.item1.photoUrl),
        this.profileStats = ProfileStatsModel(data.item1.subscribersCount, data.item1.subscriptionsCount),
        this.profileTabs = ProfileTabsModel(
          ProfileGradesTabModel(data.item2),
          ProfileInformationTabModel(data.item1.info ?? "<--No profile information-->"),
          ProfileGradeVariantsTabModel(),
        );

  final ProfileHeadModel profileHead;
  final ProfileStatsModel profileStats;
  final ProfileTabsModel profileTabs;
}

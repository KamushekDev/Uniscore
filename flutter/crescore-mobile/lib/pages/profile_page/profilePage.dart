import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/pages/login_page/login_page.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_head_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_stats_model.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_tabs_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_head_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_stats_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_tabs_widget.dart';
import 'package:Uniscore/widgets/bottom_navigation_widget.dart';
import 'package:Uniscore/widgets/async_snapshot_landing_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "/profile";
  static const String name = 'Profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final IBackendService _bs;
  late final FirebaseClient _fc;

  @override
  void initState() {
    super.initState();
    _bs = GetIt.I.get<IBackendService>();
    _fc = GetIt.I.get<FirebaseClient>();
  }

  Future _signOut() async {
    await _fc.signOut();
    return Future.microtask(() => Navigator.pushNamedAndRemoveUntil(
          context,
          LoginPage.routeName,
          (_) => false,
        ));
  }

  Future<Tuple2<Profile, List<UserGradedContent>>> getProfileAndGrades() async {
    var profileTask = _bs.getProfile();
    var gradesTask = _bs.getUserGrades(0, 10);

    var profile = await profileTask;
    var grades = await gradesTask;

    return Tuple2(profile, grades);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        child: SafeArea(
          child: Center(
            child: FutureBuilder(
              future: getProfileAndGrades(),
              builder: (context, AsyncSnapshot snapshot) => AsyncSnapshotLanding(
                snapshot,
                (Tuple2<Profile, List<UserGradedContent>> data) => _ProfilePageLanding(data.item1, data.item2, _signOut),
              ),
            ),
          ),
        ),
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(3),
    );
  }
}

class _ProfilePageLanding extends StatelessWidget {
  final Profile _profile;
  final List<UserGradedContent> _grades;
  final Future Function()? _logout;

  const _ProfilePageLanding(this._profile, this._grades, this._logout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHead(ProfileHeadModel(_profile.username, null)),
        ProfileStats(ProfileStatsModel(_profile.subscribersCount, _profile.subscriptionsCount)),
        OutlinedButton(
          child: Text(
            "Sign out",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: _logout,
        ),
        ProfileTabs(ProfileTabsModel(_grades)),
      ],
    );
  }
}

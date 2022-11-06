import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/pages/login_page/login_page.dart';
import 'package:Uniscore/pages/profile_page/Models/profile_landing_model.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_end_drawer_widget.dart';
import 'package:Uniscore/pages/profile_page/widgets/profile_landing_widget.dart';
import 'package:Uniscore/widgets/bottom_navigation_widget.dart';
import 'package:Uniscore/widgets/async_snapshot_landing_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/gestures.dart';
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
    var gradesTask = <UserGradedContent>[];

    var profile = await profileTask;
    var grades = <UserGradedContent>[];

    return Tuple2(profile, grades);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: ProfileEndDrawer(_signOut),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Center(
          child: FutureBuilder(
            future: getProfileAndGrades(),
            builder: (context, AsyncSnapshot snapshot) => AsyncSnapshotLanding(
              snapshot,
              (Tuple2<Profile, List<UserGradedContent>> data) => Builder(
                builder: (context) {
                  return ProfileLanding(ProfileLandingModel.fromData(data), openSettingsDrawer: () => Scaffold.of(context).openEndDrawer(),);
                }
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(3),
    );
  }
}

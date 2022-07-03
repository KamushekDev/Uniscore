import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/utils/assets.dart';
import 'package:Uniscore/widgets/bottom_navigation_widget.dart';
import 'package:Uniscore/widgets/graded_content_card.dart';
import 'package:Uniscore/widgets/something_wrong.dart';
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

  @override
  void initState() {
    super.initState();
    _bs = GetIt.I.get<IBackendService>();
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
              builder: (context, AsyncSnapshot<Tuple2<Profile, List<UserGradedContent>>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator.adaptive();
                  case ConnectionState.done:
                    {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          var data = snapshot.data!;
                          return _ProfilePageLanding(data.item1, data.item2);
                        }
                        return const SomethingWrongWidget();
                      }
                      if (snapshot.hasError) {
                        return SomethingWrongWidget(message: snapshot.error.toString());
                      }
                      return const SomethingWrongWidget();
                    }
                  case ConnectionState.none:
                  case ConnectionState.active:
                    return SomethingWrongWidget(message: "Snapshot state is ${snapshot.connectionState}");
                }
              },
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

  const _ProfilePageLanding(this._profile, this._grades, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileHead(_profile.username),
        _ProfileStats(_profile.subscribersCount, _profile.subscriptionsCount),
        OutlinedButton(
          child: Text(
            "Sign out",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: null,
        ),
        _ProfileTabs(_grades),
      ],
    );
  }
}

class _ProfileHead extends StatelessWidget {
  final String _username;

  const _ProfileHead(this._username, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int radius = 50;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: radius + 2,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: CircleAvatar(
              foregroundImage: const AssetImage(Assets.emptyAvatar),
              radius: radius.toDouble(),
            ),
          ),
        ),
        Text(
          _username,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}

class _ProfileStats extends StatelessWidget {
  final int _subscribersCount;
  final int _subscriptionsCount;

  const _ProfileStats(this._subscribersCount, this._subscriptionsCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(children: [
            Text(
              _subscribersCount.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4),
            Text(
              "Подписчиков",
              style: Theme.of(context).textTheme.bodyText1,
            )
          ]),
        )),
        Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(children: [
            Text(
              _subscriptionsCount.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4),
            Text(
              "Подписок",
              style: Theme.of(context).textTheme.bodyText1,
            )
          ]),
        )),
      ],
    );
  }
}

class _ProfileTabs extends StatelessWidget {
  final List<UserGradedContent> _grades;

  const _ProfileTabs(this._grades, {Key? key}) : super(key: key);

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
                    _ProfileGrades(_grades),
                    const _ProfileInformation(),
                    const _ProfileGradeVariants(),
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

class _ProfileGrades extends StatelessWidget {
  final List<UserGradedContent> _grades;

  const _ProfileGrades(this._grades, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _grades.length,
      itemBuilder: (context, index) => GradedContentCard(_grades[index]),
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

class _ProfileInformation extends StatelessWidget {
  const _ProfileInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Информация"));
  }
}

class _ProfileGradeVariants extends StatelessWidget {
  const _ProfileGradeVariants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Text("Lol"),
      ),
    );
  }
}

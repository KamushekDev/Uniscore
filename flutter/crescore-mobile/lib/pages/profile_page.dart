import 'package:crescore/clients/firebase/firebase_client.dart';
import 'package:crescore/clients/firebase/user_data.dart';
import 'package:crescore/generated/Scores.pb.dart';
import 'package:crescore/grpc/moq/scores_moq.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/widgets/avatar_widget.dart';
import 'package:crescore/widgets/graded_content_widget.dart';
import 'package:crescore/widgets/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  static const String name = 'Profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final FirebaseClient _fc;
  late final ScoresClient _sc;
  late final UserData _user;

  @override
  void initState() {
    super.initState();
    _fc = GetIt.I.get<FirebaseClient>();
    _sc = GetIt.I.get<ScoresClient>();
    _user = _fc.getUser();
  }

  void signOut() async {
    await _fc.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: FuturePage(
      _sc.getProfile(),
        // Future.delayed(Duration(), () => GetProfileResponse()),
        (GetProfileResponse r) => Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      AvatarWidget(_fc.getUser().getPhotoUrl(size: 100), 50)),
              Text(
                r.user.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    child: Column(children: [
                      Text(
                        r.subscribersCount.toString(),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    child: Column(children: [
                      Text(
                        r.subscriptionsCount.toString(),
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
              ),
              OutlinedButton(
                child: Text(
                  "Sign out",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: signOut,
              ),
              Expanded(
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
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12),
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    GradedContentWidget(
                                        ScoresMoq.createGradedContent()),
                              ),
                              const Center(child: Text("Информация")),
                              const Center(
                                child: Card(
                                  child: Text("Lol"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

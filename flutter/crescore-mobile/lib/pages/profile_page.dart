import 'package:crescore/grpc/scores_moq.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:crescore/pages/shared.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  static const String name = 'Profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return FuturePage(
      Shared.appBar(ProfilePage.name, context),
      Future.delayed(const Duration(milliseconds: 700)),
          (_) => const Text("To be made."),
    );
  }
}

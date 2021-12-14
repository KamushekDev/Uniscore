import 'package:crescore/grpc/scores_moq.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:crescore/pages/shared.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  static const String name = 'Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FuturePage(
      Shared.appBar(HomePage.name, context),
      GetIt.I.get<ScoresMoq>().homeMethod(),
      (int data) => Text(data.toString()),
    );
  }
}

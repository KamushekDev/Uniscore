import 'package:crescore/grpc/scores_moq.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:crescore/pages/shared.dart';
import 'package:get_it/get_it.dart';

class AddScorePage extends StatefulWidget {
  static const String routeName = '/addScore';
  static const String name = 'Add';

  const AddScorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  @override
  Widget build(BuildContext context) {
    return FuturePage(
      Shared.appBar(AddScorePage.name, context),
      Future.delayed(const Duration(milliseconds: 700)),
          (_) => const Text("To be made."),
    );
  }
}

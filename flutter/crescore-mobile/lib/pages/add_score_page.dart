import 'package:crescore/grpc/moq/scores_moq.dart';
import 'package:crescore/widgets/future_page.dart';
import 'package:flutter/material.dart';
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
      Future.delayed(const Duration(milliseconds: 700), () => 1),
      (_) => Column(
        children: const [
          TextField(),
        ],
      ),
    );
  }
}

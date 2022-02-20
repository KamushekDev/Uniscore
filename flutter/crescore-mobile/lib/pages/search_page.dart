import 'package:crescore/grpc/moq/scores_moq.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/widgets/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';
  static const String name = 'Search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late final ScoresClient _scores;

  @override
  void initState() {
    super.initState();
    _scores = GetIt.I.get<ScoresClient>();
  }

  @override
  Widget build(BuildContext context) {
    return FuturePage(
      Future.delayed(Duration()),
      (_) => const Text("To be made."),
    );
  }
}

import 'package:crescore/grpc/scores_moq.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:crescore/pages/shared.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';
  static const String name = 'Search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return FuturePage(
      Shared.appBar(SearchPage.name, context),
      Future.delayed(const Duration(milliseconds: 700)),
          (_) => const Text("To be made."),
    );
  }
}

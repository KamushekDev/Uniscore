import 'package:crescore/grpc/moq/moq_models.dart';
import 'package:crescore/grpc/moq/scores_moq.dart';
import 'package:crescore/widgets/graded_content_widget.dart';
import 'package:crescore/widgets/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  static const String name = 'Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget onData(List<GradedContent> data) {
    return ListView.builder(
      itemBuilder: (c, index) => GradedContentWidget(data[index]),
      itemCount: data.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FuturePage(
        GetIt.I.get<ScoresMoq>().getHomePageContent(34),
        (List<GradedContent> data) => onData(data),
      ),
    );
  }
}

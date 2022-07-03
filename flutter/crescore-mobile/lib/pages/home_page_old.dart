import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/grpc/moq/moq_models.dart';
import 'package:Uniscore/widgets/graded_content_widget.dart';
import 'package:Uniscore/widgets/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePageOld extends StatefulWidget {
  static const String routeName = '/home';
  static const String name = 'Home';

  const HomePageOld({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageOldState();
}

class _HomePageOldState extends State<HomePageOld> {
  Widget onData(List<GradedContent> data) {
    return ListView.builder(
      itemBuilder: (c, index) => GradedContentWidget(data[index]),
      itemCount: data.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ИДИНАХУЙ"));

    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
    //   child: FuturePage(
    //     GetIt.I.get<IBackendService>().getHomePageContent(34),
    //     (List<GradedContent> data) => onData(data),
    //   ),
    // );
  }
}

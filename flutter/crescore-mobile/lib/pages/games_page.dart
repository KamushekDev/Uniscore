import 'package:crescore/generated/Scores.pb.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/pages/shared.dart';
import 'package:crescore/widgets/game_widget.dart';
import 'package:crescore/widgets/helpers/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GamesPage extends StatefulWidget {
  static const String routeName = '/games';
  static const String name = 'Games';

  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  Widget onData(List<Game> games) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return GameWidget(games[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FuturePage<List<Game>>(
      Shared.appBar(GamesPage.name, context),
      GetIt.I.get<ScoresClient>().getGames(50),
      (List<Game> data) => onData(data),
    );
  }
}

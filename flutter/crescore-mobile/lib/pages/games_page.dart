import 'package:crescore/generated/Scores.pb.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/pages/shared.dart';
import 'package:crescore/widgets/game_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GamesPage extends StatefulWidget {
  static const String routeName = '/games';

  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Shared.drawer(context),
      appBar: Shared.appBar('Games', context),
      body: Center(
        child: FutureBuilder(
          future: GetIt.I.get<ScoresClient>().getGames(50),
          builder: (BuildContext context, AsyncSnapshot<List<Game>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                {
                  if (snapshot.hasData) {
                    var games = snapshot.data!;
                    return ListView.builder(
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        return GameWidget(games[index]);
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Text("WTF!?!?!?!?");
                }
              case ConnectionState.none:
              case ConnectionState.active:
                return Text("Wrong state!?!?!??!");
            }
          },
        ),
      ),
    );
  }
}

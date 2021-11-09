import 'package:crescore/generated/Scores.pb.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final Game game;

  const GameWidget(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              child: Text(
                game.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.button
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(game.score.value.toString()),
          ),
          Text(game.average.toStringAsFixed(3)),
        ],
      ),
    ));
  }
}

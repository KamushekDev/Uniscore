import 'package:Uniscore/pages/profile_page/Models/profile_stats_model.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final ProfileStatsModel _stats;

  const ProfileStats(this._stats, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var edgeBox = const SizedBox(width: 40);
    var middleGap = const SizedBox(width: 16);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        edgeBox,
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(children: [
                Text(
                  _stats.subscribersCount.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 4),
                Text(
                  "Подписчиков",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
            ),
          ),
        ),
        middleGap,
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(children: [
                Text(
                  _stats.subscriptionsCount.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 4),
                Text(
                  "Подписок",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ]),
            ),
          ),
        ),
        edgeBox,
      ],
    );
  }
}

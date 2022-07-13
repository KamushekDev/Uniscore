import 'package:Uniscore/pages/profile_page/Models/profile_stats_model.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final ProfileStatsModel _stats;

  const ProfileStats(this._stats, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeBox = SizedBox(width: 40);
    const middleGap = SizedBox(width: 16);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        edgeBox,
        _StatCard(_stats.subscribersCount, "Подписчиков"),
        middleGap,
        _StatCard(_stats.subscriptionsCount, "Подписок"),
        edgeBox,
      ],
    );
  }
}

class _StatCard extends StatelessWidget {

  const _StatCard(this.statValue, this.statLabel);

  final int statValue;
  final String statLabel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(children: [
            Text(
              statValue.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              statLabel,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:Uniscore/utils/assets.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final int radius;
  final String? imageUri;

  const UserAvatar(this.radius, this.imageUri, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: radius + 2,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: CircleAvatar(
          child: Icon(Icons.account_circle, size: radius.toDouble() * 2),
          //foregroundImage: const AssetImage(Assets.emptyAvatar),
          radius: radius.toDouble(),
        ),
      ),
    );
  }
}

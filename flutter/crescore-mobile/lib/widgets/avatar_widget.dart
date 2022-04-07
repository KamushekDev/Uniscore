import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final int radius;

  const AvatarWidget(this.imageUrl, this.radius, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 2,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: CircleAvatar(
        foregroundImage: NetworkImage(imageUrl),
        radius: radius.toDouble(),
      ),
    );
  }
}

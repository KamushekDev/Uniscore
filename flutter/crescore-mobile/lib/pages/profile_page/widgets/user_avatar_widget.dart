import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final int radius;
  final String? imageUri;

  const UserAvatar(this.radius, this.imageUri, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + 2,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: CircleAvatar(
        radius: radius.toDouble(),
        child:
        ClipOval(
          clipBehavior: Clip.hardEdge,
          child: imageUri?.isEmpty ?? true
              ? Icon(Icons.account_circle, size: radius.toDouble() * 2)
              : Image(image: NetworkImage(imageUri!)),
        )
        ,
      ),
    );
  }
}

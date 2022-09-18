import 'package:Uniscore/pages/profile_page/extra/app_bar_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar(this.height, {Key? key, this.cornerRadius = 0, this.cutoutRadius = 0, this.onMenuButtonPressed}) : super(key: key);

  final double height;
  final double cornerRadius;
  final double cutoutRadius;
  final void Function()? onMenuButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(cornerRadius, cutoutRadius),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Container(
          height: height,
          color: Theme.of(context).colorScheme.tertiary, //Color.fromARGB(100, 255, 0, 0),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: onMenuButtonPressed,
                        splashRadius: 16,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/rendering.dart';

class AppBarClipper extends CustomClipper<Path> {
  const AppBarClipper(this.cornerRadius, this.cutoutRadius);

  final double cornerRadius;
  final double cutoutRadius;

  @override
  Path getClip(Size size) {
    var rect = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width, size.height),
          bottomLeft: Radius.circular(cornerRadius),
          bottomRight: Radius.circular(cornerRadius),
        ),
      );

    var rSize = rect.getBounds();

    var cutOut = Path()..addOval(Rect.fromCircle(center: Offset(rSize.width / 2, rSize.height), radius: cutoutRadius));

    return Path.combine(PathOperation.difference, rect, cutOut);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

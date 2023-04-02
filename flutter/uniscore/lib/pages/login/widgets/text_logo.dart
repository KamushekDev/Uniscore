import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.displayMedium,
        children: const [
          TextSpan(text: "uni", style: TextStyle(color: Color.fromARGB(255, 0, 102, 255))),
          TextSpan(text: "score", style: TextStyle(color: Color.fromARGB(255, 55, 57, 74))),
        ],
      ),
    );
  }
}

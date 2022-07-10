import 'package:flutter/material.dart';

class SomethingWrongWidget extends StatelessWidget {
  final String? message;

  const SomethingWrongWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ooops...", style: Theme.of(context).textTheme.headline2),
          SizedBox.fromSize(size: const Size.fromHeight(12)),
          Text("Something went wrong", style: Theme.of(context).textTheme.bodyText2),
          if (message?.isNotEmpty == true)
            SizedBox.fromSize(size: const Size.fromHeight(12)),
          if (message?.isNotEmpty == true)
            Text(message!, style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}

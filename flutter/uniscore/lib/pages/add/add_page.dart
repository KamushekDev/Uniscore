import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

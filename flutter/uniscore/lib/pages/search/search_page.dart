import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

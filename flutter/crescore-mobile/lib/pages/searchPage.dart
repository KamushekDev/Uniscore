import 'package:crescore/widgets/bottom_navigation_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';
  static const String name = 'Search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoubleBackToCloseApp(
        child: SafeArea(
          child: Center(
            child: Text("Search"),
          ),
        ),
        snackBar: SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
      bottomNavigationBar: BottomNavigation(1),
    );
  }
}

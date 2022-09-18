import 'package:Uniscore/pages/home_page/widgets/app_bar_widget.dart';
import 'package:Uniscore/widgets/bottom_navigation_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  static const String name = "Home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(HomePage.name),
      body: DoubleBackToCloseApp(
        child: Center(
          child: Text("Home"),
        ),
        snackBar: SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
      bottomNavigationBar: BottomNavigation(0),
    );
  }
}

import 'package:Uniscore/pages/home_page/widgets/app_bar_widget.dart';
import 'package:Uniscore/widgets/bottom_navigation_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  static const String routeName = '/add';
  static const String name = 'Add';

  const AddPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
            child: Text("Add"),
          ),
        ),
        snackBar: SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
      bottomNavigationBar: BottomNavigation(2),
    );
  }
}

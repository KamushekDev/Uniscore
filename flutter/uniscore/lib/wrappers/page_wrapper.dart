import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatefulWidget {
  const PageWrapper({required this.child, this.appBar, this.navigationBar, Key? key}) : super(key: key);

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? navigationBar;

  @override
  State<StatefulWidget> createState() => PageWrapperState();
}

class PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(content: Text('Tap back again to leave')),
        child: widget.child,
      ),
      bottomNavigationBar: widget.navigationBar,
    );
  }
}

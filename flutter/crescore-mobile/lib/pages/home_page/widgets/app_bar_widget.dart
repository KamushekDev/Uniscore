import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const AppBarWidget(String title, {Key? key})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

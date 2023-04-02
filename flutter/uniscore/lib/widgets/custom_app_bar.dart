import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const CustomAppBar(String title, {Key? key})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

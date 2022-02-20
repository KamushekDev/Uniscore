import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? _title;

  const AppBarWidget(String? title, {Key? key})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_title == null || _title!.isEmpty) {
      return const SizedBox.shrink();
    }

    return AppBar(
      title: Text(_title!),
      actions: [
        IconButton(
          onPressed: () => ThemeProvider.controllerOf(context).nextTheme(),
          icon: const Icon(Icons.wb_sunny_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

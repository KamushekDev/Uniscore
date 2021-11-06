import 'package:crescore/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Shared {
  static AppBar appBar(String title, BuildContext context) => AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => ThemeProvider.controllerOf(context).nextTheme(),
            icon: const Icon(Icons.wb_sunny_outlined),
          ),
        ],
      );

  static Drawer drawer(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
                title: const Text('Grades'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(PageRoutes.grades)),
            ListTile(
              title: const Text('Games'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(PageRoutes.games),
            ),
          ],
        ),
      );
}

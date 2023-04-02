import 'package:go_router/go_router.dart';
import 'package:uniscore/constants/routes.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;
  static final _routes = [
    Routes.home.toPath,
    Routes.search.toPath,
    Routes.add.toPath,
    Routes.profile.toPath,
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(icon: const Icon(Icons.home), label: Routes.home.toName),
        NavigationDestination(icon: const Icon(Icons.search), label: Routes.search.toName),
        NavigationDestination(icon: const Icon(Icons.add), label: Routes.add.toName),
        NavigationDestination(icon: const Icon(Icons.account_circle), label: Routes.profile.toName),
      ],
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 50,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.brown,
      onDestinationSelected: (index) => changeRoute(context, index),
      selectedIndex: _selectedIndex,
    );
  }

  void changeRoute(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }
}

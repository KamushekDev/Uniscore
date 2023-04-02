import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniscore/wrappers/router/app_router.dart';

class RouterWrapper extends StatelessWidget {
  const RouterWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AppRouter>(
      create: (_) => AppRouter(),
      child: Builder(
        builder: (providerContext) {
          return MaterialApp.router(
            routerConfig: providerContext.read<AppRouter>().router,
          );
        },
      ),
    );
  }
}

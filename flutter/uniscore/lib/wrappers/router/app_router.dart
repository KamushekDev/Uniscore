import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:uniscore/constants/routes.dart';
import 'package:uniscore/pages/add/add_page.dart';
import 'package:uniscore/pages/home/home_page.dart';
import 'package:uniscore/pages/login/login_page.dart';
import 'package:uniscore/pages/profile/profile_page.dart';
import 'package:uniscore/pages/search/search_page.dart';
import 'package:uniscore/services/firebase/firebase_service.dart';
import 'package:uniscore/widgets/custom_app_bar.dart';
import 'package:uniscore/widgets/custom_navigation_bar.dart';
import 'package:uniscore/wrappers/page_wrapper.dart';

class AppRouter {
  late final FirebaseService _firebaseService;

  AppRouter() {
    _firebaseService = GetIt.I.get<FirebaseService>();
  }

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: Routes.home.toPath,
    navigatorKey: _rootNavigatorKey,
    redirect: redirectFunction,
    routes: [
      GoRoute(
        path: Routes.login.toPath,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: PageWrapper(
              child: LoginPage(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.home.toPath,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: PageWrapper(
              appBar: CustomAppBar(HomePage.title),
              navigationBar: CustomNavigationBar(),
              child: HomePage(),
            ),
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: PageWrapper(
              navigationBar: const CustomNavigationBar(),
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: Routes.search.toPath,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SearchPage(),
              );
            },
          ),
          GoRoute(
            path: Routes.add.toPath,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: AddPage(),
              );
            },
          ),
          GoRoute(
            path: Routes.profile.toPath,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: ProfilePage(),
              );
            },
          ),
        ],
      ),
    ],
  );

  String? redirectFunction(BuildContext context, GoRouterState state) {
    var isSignedIn = _firebaseService.isSignedIn();
    if (!isSignedIn) {
      return Routes.login.toPath;
    } else if (state.location == Routes.login.toPath) {
      return Routes.home.toPath;
    }
    return null;
  }
}
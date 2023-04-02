enum Routes {
  login,
  home,
  search,
  add,
  profile,
}

extension AppPageExtension on Routes {
  String get toPath {
    switch (this) {
      case Routes.login:
        return '/login';
      case Routes.home:
        return '/home';
      case Routes.search:
        return '/search';
      case Routes.add:
        return '/add';
      case Routes.profile:
        return '/profile';
    }
  }

  String get toName {
    switch (this) {
      case Routes.login:
        return 'Login';
      case Routes.home:
        return 'Home';
      case Routes.search:
        return 'Search';
      case Routes.add:
        return 'Add';
      case Routes.profile:
        return 'Profile';
    }
  }
}

import 'package:Uniscore/models/user_graded_content.dart';
import 'package:Uniscore/pages/add_page/addPage.dart';
import 'package:Uniscore/pages/user_graded_content_page/user_graded_content_page.dart';
import 'package:Uniscore/pages/home_page/homePage.dart';
import 'package:Uniscore/pages/login_page/login_page.dart';
import 'package:Uniscore/pages/profile_page/profilePage.dart';
import 'package:Uniscore/pages/search_page/searchPage.dart';
import 'package:Uniscore/utils/instantPageRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';

class CustomRouter {
  static Route? generateRoute(RouteSettings route) {
    {
      switch (route.name) {
        case LoginPage.routeName:
          return InstantPageRoute(builder: (_) => const LoginPage());
        case HomePage.routeName:
          return InstantPageRoute(builder: (_) => const HomePage());
        case SearchPage.routeName:
          return InstantPageRoute(builder: (_) => const SearchPage());
        case AddPage.routeName:
          return InstantPageRoute(builder: (_) => const AddPage());
        case ProfilePage.routeName:
          return InstantPageRoute(builder: (_) => const ProfilePage());
        case UserGradedContentPage.routeName:
          var args = route.arguments as UserGradedContent;
          return InstantPageRoute(builder: (_) => UserGradedContentPage(args));
      }
      throw const InvalidConfigException();
    }
  }
}

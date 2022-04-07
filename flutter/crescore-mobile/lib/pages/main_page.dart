import 'package:crescore/pages/profile_page.dart';
import 'package:crescore/pages/search_page.dart';
import 'package:crescore/widgets/app_bar_widget.dart';
import 'package:crescore/widgets/bottom_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_score_page.dart';
import 'home_page.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  late final FirebaseAuth auth;

  static const List<Widget> pages = [
    HomePage(),
    SearchPage(),
    AddScorePage(),
    ProfilePage(),
  ];

  static const List<String> pageTitles = [
    "Home",
    "",
    "",
    "",
  ];

  String _currentTitle = pageTitles[0];

  void onPageChanged(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentTitle = pageTitles[index];
    });
  }

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      Future.microtask(
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        ),
      );
      return const Center(child: Text("You should be redirected immediately."));
    }

    return Scaffold(
      appBar: AppBarWidget(_currentTitle),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomBarWidget(onPageChanged),
    );
  }
}

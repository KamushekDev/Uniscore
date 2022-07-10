import 'package:Uniscore/pages/add_page/addPage.dart';
import 'package:Uniscore/pages/home_page/homePage.dart';
import 'package:Uniscore/pages/profile_page/profilePage.dart';
import 'package:Uniscore/pages/search_page/searchPage.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int _currentIndex;

  const BottomNavigation(this._currentIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile")
        // BottomNavigationBarItem(icon: AvatarWidget(_fc.getUser().getPhotoUrl(size: 24), 12),
        //   label: "Profile",
        // ),
      ],
      currentIndex: _currentIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (_) => false);
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(
                context, SearchPage.routeName, (_) => false);
            break;
          case 2:
            Navigator.pushNamedAndRemoveUntil(
                context, AddPage.routeName, (_) => false);
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(
                context, ProfilePage.routeName, (_) => false);
            break;
        }
      },
    );
  }
}

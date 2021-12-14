import 'package:crescore/pages/add_score_page.dart';
import 'package:crescore/pages/home_page.dart';
import 'package:crescore/pages/profile_page.dart';
import 'package:crescore/pages/search_page.dart';
import 'package:flutter/material.dart';

class PageBase<TFutureResult> extends StatefulWidget {
  final AppBar _appBar;
  final Widget _body;

  const PageBase(AppBar appBar, Widget body, {Key? key})
      : _appBar = appBar,
        _body = body,
        super(key: key);

  @override
  State<PageBase> createState() => _PageBaseState();
}

class _PageBaseState<TFutureResult> extends State<PageBase> {
  static const String _myVkPicUrl =
      "https://sun9-26.userapi.com/s/v1/ig2/U0LAqYooMRlCKrbwiJrdBdGHCDhiquzaUWP74YoQbErV40O-SbXrjx9Rg8c6-DxNFvZZ_dm0Su7JU_gFjA0EfBZX.jpg?size=200x200&quality=96&crop=35,34,272,272&ava=1";
  int _navigationBarIndex = 0;

  BottomNavigationBar buildBottomNavigationBar() {
    const List<BottomNavigationBarItem> navigationBarItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: HomePage.name),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: SearchPage.name),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: AddScorePage.name),
      BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: NetworkImage(_myVkPicUrl),
          ),
          label: ProfilePage.name),
    ];
    const List<String> navigationRoutes = [
      HomePage.routeName,
      SearchPage.routeName,
      AddScorePage.routeName,
      ProfilePage.routeName,
    ];

    return BottomNavigationBar(
      items: navigationBarItems,
      showUnselectedLabels: true,
      selectedItemColor: Colors.amber,
      currentIndex: _navigationBarIndex,
      onTap: (index) => {
        if (index != _navigationBarIndex)
          {
            setState(
              () => {
                _navigationBarIndex = index,
                Navigator.of(context)
                    .pushReplacementNamed(navigationRoutes[index])
              },
            ),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget._appBar,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Center(
        child: widget._body,
      ),
    );
  }
}

import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BottomBarWidget extends StatefulWidget {
  final void Function(int) _pageChanged;

  const BottomBarWidget(void Function(int) pageChanged, {Key? key})
      : _pageChanged = pageChanged,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedItem = 0;

  late final FirebaseClient _fc;

  @override
  void initState() {
    super.initState();

    _fc = GetIt.I.get<FirebaseClient>();
  }

  @override
  Widget build(BuildContext context) {
    // todo: заменить на NovigationBar, который поддерживает Marial3
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.search), label: "Search"),
        const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        BottomNavigationBarItem(
          icon: AvatarWidget(_fc.getUser().getPhotoUrl(size: 24), 12),
          label: "Profile",
        ),
      ],
      currentIndex: _selectedItem,
      selectedItemColor: Colors.amber,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) => {
        if (index != _selectedItem)
          {
            widget._pageChanged(index),
            setState(() {
              _selectedItem = index;
            })
          }
      },
    );
  }
}

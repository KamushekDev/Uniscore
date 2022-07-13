import 'package:Uniscore/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ProfileEndDrawer extends StatefulWidget {
  const ProfileEndDrawer(this.signOut, {Key? key}) : super(key: key);

  final Future Function() signOut;

  @override
  State<StatefulWidget> createState() => _ProfileEndDrawerState();
}

class _ProfileEndDrawerState extends State<ProfileEndDrawer> {
  bool _useDarkTheme = false;

  @override
  void didChangeDependencies() {
    var theme = ThemeProvider.controllerOf(context).theme.id == Themes.darkId;
    setState(() {
      _useDarkTheme = theme;
    });
    super.didChangeDependencies();
  }

  void changeTheme(bool useDark) {
    setState(() {
      _useDarkTheme = useDark;
    });
    ThemeProvider.controllerOf(context).nextTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      title: Text("Use dark theme"),
                      trailing: Switch(
                        value: _useDarkTheme,
                        onChanged: changeTheme,
                      ),
                    ),
                    ListTile(
                      title: MaterialButton(
                        color: Colors.green,
                        child: Text("Sign out", style: Theme.of(context).textTheme.bodyLarge),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: widget.signOut,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Version: DEBUG"),
            ),
          ],
        ),
      ),
    );
  }
}

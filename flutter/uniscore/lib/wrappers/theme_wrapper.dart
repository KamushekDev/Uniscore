import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:uniscore/constants/themes.dart';

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: Themes.all,
      defaultThemeId: Themes.darkId,
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Uniscore',
            builder: (context, widget){
              assert(widget == null);
              return child;
            },
          ),
        ),
      ),
    );
  }
}

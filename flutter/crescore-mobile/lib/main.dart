import 'package:crescore/grpc/scores.dart';
import 'package:crescore/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:theme_provider/theme_provider.dart';

import 'grpc/scores_moq.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup(){
  GetIt.I.registerSingleton<ScoresClient>(ScoresClient());
  GetIt.I.registerSingleton<ScoresMoq>(ScoresMoq());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme.dark(),
        // This is standard dark theme (id is default_dark_theme)
        AppTheme(
          id: "custom_theme", // Id(or name) of the theme(Has to be unique)
          description: "My Custom Theme", // Description of theme
          data: ThemeData(
            // Real theme data
            primaryColor: Colors.black,
            accentColor: Colors.red,
          ),
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'CreScore',
            initialRoute: PageRoutes.games,
            onGenerateRoute: (settings) => PageRoutes.createBuilder(settings),
          ),
        ),
      ),
    );
  }
}

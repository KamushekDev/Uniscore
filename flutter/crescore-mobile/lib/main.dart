import 'package:crescore/clients/firebase/firebase_client.dart';
import 'package:crescore/grpc/interceptors/firebase_auth_interceptor.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:theme_provider/theme_provider.dart';

import 'grpc/moq/scores_moq.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

Future setup() async {
  var fc = FirebaseClient();
  await fc.init();
  GetIt.I.registerSingleton<FirebaseClient>(fc);

  var interceptor = FirebaseAuthInterceptor(fc);
  var client = ScoresClient(interceptors: [interceptor]);
  GetIt.I.registerSingleton<ScoresClient>(client);

  GetIt.I.registerSingleton<ScoresMoq>(ScoresMoq());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme.dark(),
        AppTheme(
          id: "custom_theme",
          description: "My Custom Theme",
          data: ThemeData(
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
            home: const LoginPage(),
          ),
        ),
      ),
    );
  }
}

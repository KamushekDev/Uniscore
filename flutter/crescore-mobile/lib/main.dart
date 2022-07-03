import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/grpc/backendServiceMoq.dart';
import 'package:Uniscore/grpc/interceptors/firebase_auth_interceptor.dart';
import 'package:Uniscore/pages/addPage.dart';
import 'package:Uniscore/pages/homePage.dart';
import 'package:Uniscore/pages/login_page.dart';
import 'package:Uniscore/pages/profilePage.dart';
import 'package:Uniscore/pages/searchPage.dart';
import 'package:Uniscore/utils/customPageRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:get_it/get_it.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:grpc/grpc.dart';

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

  GetIt.I.registerSingleton<IBackendService>(BackendServiceMoq());
}

void setupChannel() {
  var debugChannel = ClientChannel(
    '192.168.1.2',
    port: 82,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  var releaseChannel = ClientChannel(
    'scores-grpc.uniscore.ru',
    port: 443,
    options: const ChannelOptions(credentials: ChannelCredentials.secure()),
  );

  GetIt.I.registerSingleton<ClientChannel>(debugChannel);
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
            initialRoute: LoginPage.routeName,
            // routes: {
            //   LoginPage.routeName: (context) => const LoginPage(),
            //   HomePage.routeName: (context) => const HomePage(),
            //   SearchPage.routeName: (context) => const SearchPage(),
            //   AddPage.routeName: (context) => const AddPage(),
            //   ProfilePage.routeName: (context) => const ProfilePage(),
            // },
            onGenerateInitialRoutes: (route) {
              if (route == LoginPage.routeName) {
                return [CustomPageRoute(builder: (_) => const LoginPage())];
              }
              throw const InvalidConfigException();
            },
            onGenerateRoute: (route) {
              switch(route.name){
                case LoginPage.routeName:
                  return CustomPageRoute(builder: (_) => const LoginPage());
                case HomePage.routeName:
                  return CustomPageRoute(builder: (_) => const HomePage());
                case SearchPage.routeName:
                  return CustomPageRoute(builder: (_) => const SearchPage());
                case AddPage.routeName:
                  return CustomPageRoute(builder: (_) => const AddPage());
                case ProfilePage.routeName:
                  return CustomPageRoute(builder: (_) => const ProfilePage());
              }
              throw const InvalidConfigException();
            },
          ),
        ),
      ),
    );
  }
}

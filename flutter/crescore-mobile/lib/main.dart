import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/grpc/backendServiceMoq.dart';
import 'package:Uniscore/grpc/interceptors/firebase_auth_interceptor.dart';
import 'package:Uniscore/pages/add_page/addPage.dart';
import 'package:Uniscore/pages/home_page/homePage.dart';
import 'package:Uniscore/pages/login_page/login_page.dart';
import 'package:Uniscore/pages/profile_page/profilePage.dart';
import 'package:Uniscore/pages/search_page/searchPage.dart';
import 'package:Uniscore/utils/custom_router.dart';
import 'package:Uniscore/utils/instantPageRoute.dart';
import 'package:Uniscore/utils/themes.dart';
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
      themes: Themes.all,
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
                return [InstantPageRoute(builder: (_) => const LoginPage())];
              }
              throw const InvalidConfigException();
            },
            onGenerateRoute: CustomRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}

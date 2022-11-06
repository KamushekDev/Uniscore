import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/generated/BFF.pbgrpc.dart';
import 'package:Uniscore/grpc/backendService.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/grpc/backendServiceMoq.dart';
import 'package:Uniscore/grpc/interceptors/firebase_auth_interceptor.dart';
import 'package:Uniscore/pages/login_page/login_page.dart';
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
  var authInterceptor = FirebaseAuthInterceptor(fc);

  var bffClient = getBffClient(authInterceptor);

  GetIt.I.registerSingleton<MobileBffApiClient>(bffClient);

  // GetIt.I.registerSingleton<IBackendService>(BackendServiceMoq());
  GetIt.I.registerSingleton<IBackendService>(BackendService());
}

MobileBffApiClient getBffClient(ClientInterceptor interceptor) {
  var debugChannel = ClientChannel(
    // '192.168.1.2', // real
    '10.0.2.2', //emulator
    port: 82,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  var releaseChannel = ClientChannel(
    'scores-grpc.uniscore.ru',
    port: 443,
    options: const ChannelOptions(credentials: ChannelCredentials.secure()),
  );

  return MobileBffApiClient(debugChannel, interceptors: [interceptor]);
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
            title: 'Uniscore',
            initialRoute: LoginPage.routeName,
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

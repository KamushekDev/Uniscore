import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/pages/home_page/homePage.dart';
import 'package:Uniscore/pages/login_page/widgets/sign_through_button.dart';
import 'package:Uniscore/pages/login_page/widgets/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/assets.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  static const String name = 'Login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final FirebaseClient _fc;
  late final IBackendService _bs;

  void redirectToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomePage.routeName,
      (_) => false,
    );
  }

  void googleLogin(BuildContext context) async {
    var userCredentials = await _fc.signInWithGoogle();
    if (userCredentials.user != null) {
      await _bs.loginEcho();
      redirectToHome();
    }
  }

  @override
  void initState() {
    super.initState();
    _fc = GetIt.I.get<FirebaseClient>();
    _bs = GetIt.I.get<IBackendService>();
  }

  @override
  Widget build(BuildContext context) {
    var loadingScreen = const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));

    if (_fc.isSignedIn()) {
      Future.microtask(redirectToHome);
      return loadingScreen;
    }

    debugPrint(MediaQuery.of(context).devicePixelRatio.toString());
    debugPrint(MediaQuery.of(context).size.toString());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            const Align(
              child: TextLogo(),
              alignment: Alignment.center,
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SignThroughButton("Войти с помощью Google", Colors.white, const AssetImage(Assets.googleIcon), () => googleLogin(context)),
                  SignThroughButton("Войти с помощью VK", Color.fromARGB(255, 0, 119, 255), const AssetImage(Assets.vkIcon), null),
                  SignThroughButton("Войти с помощью Telegram", Color.fromARGB(255, 18, 144, 222), const AssetImage(Assets.telegramIcon), null),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

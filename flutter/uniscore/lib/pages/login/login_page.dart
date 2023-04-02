import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:uniscore/constants/assets.dart';
import 'package:uniscore/constants/routes.dart';
import 'package:uniscore/pages/login/widgets/sign_through_button.dart';
import 'package:uniscore/pages/login/widgets/text_logo.dart';
import 'package:uniscore/services/firebase/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late final FirebaseService _fs;

  LoginPageState() {
    _fs = GetIt.I.get<FirebaseService>();
  }

  Future googleLogin(BuildContext context) async {
    var userCredentials = await _fs.signInWithGoogle();
    if (context.mounted && userCredentials.user != null) {
        context.go(Routes.home.toPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(),
            const Align(
              child: const TextLogo(),
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

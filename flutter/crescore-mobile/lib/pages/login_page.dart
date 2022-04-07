import 'package:crescore/clients/firebase/firebase_client.dart';
import 'package:crescore/generated/Scores.pb.dart';
import 'package:crescore/grpc/moq/scores_moq.dart';
import 'package:crescore/grpc/scores.dart';
import 'package:crescore/pages/main_page.dart';
import 'package:crescore/widgets/future_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/profile';
  static const String name = 'Profile';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final FirebaseClient _fb;
  late final ScoresClient _sc;

  void redirectToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  void googleLogin(BuildContext context) async {
    var userCredentials = await _fb.signInWithGoogle();
    if (userCredentials.user != null) {
      await _sc.stub.loginEcho(LoginEchoRequest());
      redirectToHome();
    }

  }

  @override
  void initState() {
    super.initState();
    _fb = GetIt.I.get<FirebaseClient>();
    _sc = GetIt.I.get<ScoresClient>();
  }

  @override
  Widget build(BuildContext context) {
    if (_fb.isSignedIn()) {
      Future.microtask(redirectToHome);
      return const Center(child: Text("You should be redirected immediately."));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              child: Text("crescore"),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Войти с помощью:"),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 17, top: 9, bottom: 11),
                            child: Image(
                              image: ResizeImage(
                                AssetImage("assets/images/google_icon.png"),
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("Google"),
                          Spacer(),
                        ],
                      ),
                      onPressed: () => googleLogin(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 0, 119, 255)),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 17, top: 9, bottom: 11),
                            child: Image(
                              image: ResizeImage(
                                AssetImage("assets/images/vk_icon.png"),
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("VK"),
                          Spacer(),
                        ],
                      ),
                      onPressed: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 18, 144, 222)),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 17, top: 9, bottom: 11),
                            child: Image(
                              image: ResizeImage(
                                AssetImage("assets/images/telegram_icon.png"),
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text("Telegram"),
                          Spacer(),
                        ],
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

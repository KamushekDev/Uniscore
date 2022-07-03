import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
    var loadingScreen = const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()));

    if (_fc.isSignedIn()) {
      Future.microtask(redirectToHome);
      return loadingScreen;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              child: Text("UniScore"),
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

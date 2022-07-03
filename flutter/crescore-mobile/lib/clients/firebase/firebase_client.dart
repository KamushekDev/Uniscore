import 'package:Uniscore/clients/firebase/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../firebase_options.dart';

class FirebaseClient {
  static late final FirebaseAuth _auth = FirebaseAuth.instance;

  late final GoogleSignIn _googleSignIn;

  Future init() async {
    _googleSignIn = GoogleSignIn();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    _auth.idTokenChanges().listen((event) async {
      _currentToken = await event?.getIdToken() ?? "_token_";
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredentials =
        await _auth.signInWithCredential(credential);
    return userCredentials;
  }

  Future signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  UserData getUser() {
    assert(_auth.currentUser != null);
    return UserData(_auth.currentUser!);
  }

  late String _currentToken;

  String getToken() {
    return _currentToken;
  }
}

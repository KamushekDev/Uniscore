import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uniscore/services/firebase/firebase_options.dart';

class FirebaseService {
  late final FirebaseAuth _auth;
  late final GoogleSignIn _googleSignIn;

  Future init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _auth = FirebaseAuth.instance;

    _googleSignIn = GoogleSignIn();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredentials = await _auth.signInWithCredential(credential);
    return userCredentials;
  }

  Future signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  // UserData getUser() {
  //   assert(_auth.currentUser != null);
  //   return UserData(_auth.currentUser!);
  // }

  Future<String> getToken() async {
    return await _auth.currentUser?.getIdToken() ?? '_no_token_';
  }
}

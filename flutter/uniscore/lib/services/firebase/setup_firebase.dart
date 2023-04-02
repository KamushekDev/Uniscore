import 'package:get_it/get_it.dart';
import 'package:uniscore/services/firebase/firebase_service.dart';

Future<FirebaseService> setupFirebase() async {
  var fs = FirebaseService();
  await fs.init();

  GetIt.I.registerSingleton<FirebaseService>(fs);

  return fs;
}

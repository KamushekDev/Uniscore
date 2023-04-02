import 'package:flutter/material.dart';
import 'package:uniscore/grpc/setup_grpc.dart';
import 'package:uniscore/services/firebase/setup_firebase.dart';
import 'package:uniscore/wrappers/router/router_wrapper.dart';
import 'package:uniscore/wrappers/theme_wrapper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // vvv splash screen while loading vvv
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove();
  await setup();
  runApp(
    const ThemeWrapper(
      child: RouterWrapper(),
    ),
  );
}

Future setup() async {
  var fs = await setupFirebase();
  setupGrpc(fs);
}

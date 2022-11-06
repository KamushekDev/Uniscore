import 'dart:async';

import 'package:Uniscore/clients/firebase/firebase_client.dart';
import 'package:grpc/grpc.dart';

class FirebaseAuthInterceptor extends ClientInterceptor {
  final FirebaseClient _fc;
  static const String authHeaderName = "Authorization";

  FirebaseAuthInterceptor(this._fc);

  FutureOr<void> _provider(Map<String, String> metadata, String uri) async {
    var idToken = await _fc.getToken();
    metadata[authHeaderName] = 'Bearer $idToken';
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method, Q request, CallOptions options, invoker) {
    var newOptions = options.mergedWith(
      CallOptions(providers: [_provider])
    );

    return invoker(method, request, newOptions);
  }
}

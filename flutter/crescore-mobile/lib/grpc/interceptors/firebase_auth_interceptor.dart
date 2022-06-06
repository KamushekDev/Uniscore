import 'package:crescore/clients/firebase/firebase_client.dart';
import 'package:grpc/grpc.dart';

class FirebaseAuthInterceptor extends ClientInterceptor {
  final FirebaseClient _fc;
  static const String authHeaderName = "authorization";

  FirebaseAuthInterceptor(this._fc);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method, Q request, CallOptions options, invoker) {
    var idToken = _fc.getToken();
    var newOptions = options.mergedWith(
      CallOptions(
        metadata: <String, String>{
          authHeaderName: idToken,
        },
      ),
    );

    return invoker(method, request, newOptions);
  }
}

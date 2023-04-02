import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:uniscore/grpc/generated/ProfileApi.pbgrpc.dart';
import 'package:uniscore/grpc/interceptors/firebase_auth_interceptor.dart';
import 'package:uniscore/grpc/profile/profile_service.dart';
import 'package:uniscore/services/firebase/firebase_service.dart';

_ChannelType _channelType = _ChannelType.local;

void setupGrpc(FirebaseService firebaseService) {
  var firebaseInterceptor = FirebaseAuthInterceptor(firebaseService);

  // setup services
  GetIt.I.registerSingleton<ProfileService>(ProfileService(_getProfileClient(firebaseInterceptor)));
}

ProfileApiClient _getProfileClient(ClientInterceptor interceptor) => ProfileApiClient(_getChannel(), interceptors: [interceptor]);

ClientChannel _getChannel() {
  switch (_channelType) {
    case _ChannelType.local:
      return ClientChannel(
        '192.168.1.2',
        port: 82,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
    case _ChannelType.emulator:
      return ClientChannel(
        '10.0.2.2',
        port: 82,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
    case _ChannelType.production:
      return ClientChannel(
        'scores-grpc.uniscore.ru',
        port: 443,
        options: const ChannelOptions(credentials: ChannelCredentials.secure()),
      );
  }
}

enum _ChannelType { local, emulator, production }

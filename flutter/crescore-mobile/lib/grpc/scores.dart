import 'package:grpc/grpc.dart';

import 'package:crescore/generated/Scores.pbgrpc.dart';

class ScoresClient {
  late final ScoresServiceClient stub;

  ScoresClient({List<ClientInterceptor> interceptors = const []}) {
    final ClientChannel channelRelease = ClientChannel(
      'scores.grpc.crescore.net',
      port: 443,
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    final ClientChannel channelDebug = ClientChannel(
      '192.168.1.2',
      port: 82,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = ScoresServiceClient(channelDebug, interceptors: interceptors);
  }

  Future<GetProfileResponse> getProfile() async{
    var result = await stub.getProfile(GetProfileRequest());
    return result;
  }
}

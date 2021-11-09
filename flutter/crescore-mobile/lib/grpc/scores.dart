import 'package:grpc/grpc.dart';

import 'package:crescore/generated/Scores.pbgrpc.dart';

class ScoresClient {
  late final ClientChannel channel;
  late final ScoresServiceClient stub;

  ScoresClient() {
    channel = ClientChannel(
      'scores.grpc.crescore.net',
      port: 443,
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    stub = ScoresServiceClient(channel);
  }

  Future<List<Grade>> getGrades(int number) async {
    var response = await stub.getScores(GetScoresRequest(count: number));
    return response.grades;
  }

  Future<List<Game>> getGames(int number) async {
    var response = await stub.getGames(GetGamesRequest(count: number));
    return response.games;
  }
}

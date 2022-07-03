import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';

class BackendService extends IBackendService {

  @override
  Future<Profile> getProfile() {
    throw UnimplementedError();
  }

  @override
  Future loginEcho() {
    throw UnimplementedError();
  }

  @override
  Future<List<UserGradedContent>> getUserGrades(int offset, int length) {
    // TODO: implement getUserGrades
    throw UnimplementedError();
  }

}
import 'package:crescore/grpc/backendServiceInterface.dart';
import 'package:crescore/models/profile.dart';
import 'package:crescore/models/user_graded_content.dart';

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
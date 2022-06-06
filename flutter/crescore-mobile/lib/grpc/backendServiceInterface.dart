import 'package:crescore/models/profile.dart';
import 'package:crescore/models/user_graded_content.dart';

abstract class IBackendService {
  Future<Profile> getProfile();

  Future loginEcho();

  Future<List<UserGradedContent>> getUserGrades(int offset, int length);
}

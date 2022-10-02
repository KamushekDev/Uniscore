import 'package:Uniscore/generated/BFF.pbgrpc.dart';
import 'package:Uniscore/generated/google/protobuf/wrappers.pb.dart';
import 'package:Uniscore/grpc/backendServiceInterface.dart';
import 'package:Uniscore/models/gradable_content.dart';
import 'package:Uniscore/models/profile.dart';
import 'package:Uniscore/models/user_graded_content.dart';
import 'package:get_it/get_it.dart';

class BackendService extends IBackendService {

  late final MobileBffApiClient _bffClient;

  BackendService() {
    _bffClient = GetIt.I.get<MobileBffApiClient>();
  }

  @override
  Future<Profile> getProfile() async {
    var response = await _bffClient.getUserProfile(GetUserProfileRequest());
    var profile = response.selfProfile;

    return Profile(
      profile.displayName,
      profile.followers,
      profile.following,
      profile.photoUrl.value,
      profile.backgroundPhotoUrl.value,
      profile.profileInformation.value,
    );
  }

  Future<Profile> getOtherProfile(String userId) async {
    var request = GetUserProfileRequest(userId: StringValue(value: userId));
    var response = await _bffClient.getUserProfile(request);
    var profile = response.selfProfile;

    return Profile(
      profile.displayName,
      profile.followers,
      profile.following,
      profile.photoUrl.value,
      profile.backgroundPhotoUrl.value,
      profile.profileInformation.value,
    );
  }

  @override
  Future loginEcho() {
    return Future.value();
    //throw UnimplementedError();
  }

  @override
  Future<List<UserGradedContent>> getUserGrades(int offset, int length) {
    // TODO: implement getUserGrades
    throw UnimplementedError();
  }

  @override
  Future<GradableContent> getContent(int id) {
    // TODO: implement getContent
    throw UnimplementedError();
  }

}
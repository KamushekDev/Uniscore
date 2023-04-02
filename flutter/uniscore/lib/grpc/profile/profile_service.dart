import 'package:uniscore/grpc/generated/ProfileApi.pbgrpc.dart';
import 'package:uniscore/grpc/profile/profile_service_interface.dart';

class ProfileService extends IProfileService {
  late final ProfileApiClient _profileApiClient;

  ProfileService(this._profileApiClient);
}

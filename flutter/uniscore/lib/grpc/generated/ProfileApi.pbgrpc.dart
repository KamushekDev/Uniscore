///
//  Generated code. Do not modify.
//  source: ProfileApi.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'ProfileApi.pb.dart' as $0;
export 'ProfileApi.pb.dart';

class ProfileApiClient extends $grpc.Client {
  static final _$getUserProfile =
      $grpc.ClientMethod<$0.GetUserProfileRequest, $0.GetUserProfileResponse>(
          '/BFF.Mobile.ProfileApi.V1.ProfileApi/GetUserProfile',
          ($0.GetUserProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserProfileResponse.fromBuffer(value));

  ProfileApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserProfileResponse> getUserProfile(
      $0.GetUserProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserProfile, request, options: options);
  }
}

abstract class ProfileApiServiceBase extends $grpc.Service {
  $core.String get $name => 'BFF.Mobile.ProfileApi.V1.ProfileApi';

  ProfileApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserProfileRequest,
            $0.GetUserProfileResponse>(
        'GetUserProfile',
        getUserProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUserProfileRequest.fromBuffer(value),
        ($0.GetUserProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserProfileResponse> getUserProfile_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetUserProfileRequest> request) async {
    return getUserProfile(call, await request);
  }

  $async.Future<$0.GetUserProfileResponse> getUserProfile(
      $grpc.ServiceCall call, $0.GetUserProfileRequest request);
}

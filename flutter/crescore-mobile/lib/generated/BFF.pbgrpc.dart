///
//  Generated code. Do not modify.
//  source: BFF.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'BFF.pb.dart' as $0;
export 'BFF.pb.dart';

class MobileBffApiClient extends $grpc.Client {
  static final _$getUserProfile =
      $grpc.ClientMethod<$0.GetUserProfileRequest, $0.GetUserProfileResponse>(
          '/BFF.Mobile.V1.MobileBffApi/GetUserProfile',
          ($0.GetUserProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserProfileResponse.fromBuffer(value));
  static final _$getUserGrades =
      $grpc.ClientMethod<$0.GetUserGradesRequest, $0.GetUserGradesResponse>(
          '/BFF.Mobile.V1.MobileBffApi/GetUserGrades',
          ($0.GetUserGradesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserGradesResponse.fromBuffer(value));

  MobileBffApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserProfileResponse> getUserProfile(
      $0.GetUserProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserGradesResponse> getUserGrades(
      $0.GetUserGradesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserGrades, request, options: options);
  }
}

abstract class MobileBffApiServiceBase extends $grpc.Service {
  $core.String get $name => 'BFF.Mobile.V1.MobileBffApi';

  MobileBffApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserProfileRequest,
            $0.GetUserProfileResponse>(
        'GetUserProfile',
        getUserProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUserProfileRequest.fromBuffer(value),
        ($0.GetUserProfileResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetUserGradesRequest, $0.GetUserGradesResponse>(
            'GetUserGrades',
            getUserGrades_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUserGradesRequest.fromBuffer(value),
            ($0.GetUserGradesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserProfileResponse> getUserProfile_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetUserProfileRequest> request) async {
    return getUserProfile(call, await request);
  }

  $async.Future<$0.GetUserGradesResponse> getUserGrades_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetUserGradesRequest> request) async {
    return getUserGrades(call, await request);
  }

  $async.Future<$0.GetUserProfileResponse> getUserProfile(
      $grpc.ServiceCall call, $0.GetUserProfileRequest request);
  $async.Future<$0.GetUserGradesResponse> getUserGrades(
      $grpc.ServiceCall call, $0.GetUserGradesRequest request);
}

///
//  Generated code. Do not modify.
//  source: Scores.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'Scores.pb.dart' as $0;
export 'Scores.pb.dart';

class ScoresServiceClient extends $grpc.Client {
  static final _$getMyScores =
      $grpc.ClientMethod<$0.GetMyScoresRequest, $0.GetMyScoresResponse>(
          '/Scores.V1.ScoresService/GetMyScores',
          ($0.GetMyScoresRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetMyScoresResponse.fromBuffer(value));
  static final _$getHomeContent =
      $grpc.ClientMethod<$0.GetHomeContentRequest, $0.GetHomeContentResponse>(
          '/Scores.V1.ScoresService/GetHomeContent',
          ($0.GetHomeContentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetHomeContentResponse.fromBuffer(value));
  static final _$addScore =
      $grpc.ClientMethod<$0.AddScoreRequest, $0.AddScoreResponse>(
          '/Scores.V1.ScoresService/AddScore',
          ($0.AddScoreRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddScoreResponse.fromBuffer(value));
  static final _$getContent =
      $grpc.ClientMethod<$0.GetContentRequest, $0.GetContentResponse>(
          '/Scores.V1.ScoresService/GetContent',
          ($0.GetContentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetContentResponse.fromBuffer(value));
  static final _$getGrades =
      $grpc.ClientMethod<$0.GetGradesRequest, $0.GetGradesResponse>(
          '/Scores.V1.ScoresService/GetGrades',
          ($0.GetGradesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetGradesResponse.fromBuffer(value));
  static final _$loginEcho =
      $grpc.ClientMethod<$0.LoginEchoRequest, $0.LoginEchoResponse>(
          '/Scores.V1.ScoresService/LoginEcho',
          ($0.LoginEchoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LoginEchoResponse.fromBuffer(value));
  static final _$getProfile =
      $grpc.ClientMethod<$0.GetProfileRequest, $0.GetProfileResponse>(
          '/Scores.V1.ScoresService/GetProfile',
          ($0.GetProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetProfileResponse.fromBuffer(value));

  ScoresServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetMyScoresResponse> getMyScores(
      $0.GetMyScoresRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyScores, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetHomeContentResponse> getHomeContent(
      $0.GetHomeContentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHomeContent, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddScoreResponse> addScore($0.AddScoreRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addScore, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetContentResponse> getContent(
      $0.GetContentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getContent, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGradesResponse> getGrades(
      $0.GetGradesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGrades, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginEchoResponse> loginEcho(
      $0.LoginEchoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginEcho, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetProfileResponse> getProfile(
      $0.GetProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }
}

abstract class ScoresServiceBase extends $grpc.Service {
  $core.String get $name => 'Scores.V1.ScoresService';

  ScoresServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetMyScoresRequest, $0.GetMyScoresResponse>(
            'GetMyScores',
            getMyScores_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetMyScoresRequest.fromBuffer(value),
            ($0.GetMyScoresResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetHomeContentRequest,
            $0.GetHomeContentResponse>(
        'GetHomeContent',
        getHomeContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetHomeContentRequest.fromBuffer(value),
        ($0.GetHomeContentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddScoreRequest, $0.AddScoreResponse>(
        'AddScore',
        addScore_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddScoreRequest.fromBuffer(value),
        ($0.AddScoreResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetContentRequest, $0.GetContentResponse>(
        'GetContent',
        getContent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetContentRequest.fromBuffer(value),
        ($0.GetContentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGradesRequest, $0.GetGradesResponse>(
        'GetGrades',
        getGrades_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGradesRequest.fromBuffer(value),
        ($0.GetGradesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginEchoRequest, $0.LoginEchoResponse>(
        'LoginEcho',
        loginEcho_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginEchoRequest.fromBuffer(value),
        ($0.LoginEchoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProfileRequest, $0.GetProfileResponse>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProfileRequest.fromBuffer(value),
        ($0.GetProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetMyScoresResponse> getMyScores_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetMyScoresRequest> request) async {
    return getMyScores(call, await request);
  }

  $async.Future<$0.GetHomeContentResponse> getHomeContent_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetHomeContentRequest> request) async {
    return getHomeContent(call, await request);
  }

  $async.Future<$0.AddScoreResponse> addScore_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddScoreRequest> request) async {
    return addScore(call, await request);
  }

  $async.Future<$0.GetContentResponse> getContent_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetContentRequest> request) async {
    return getContent(call, await request);
  }

  $async.Future<$0.GetGradesResponse> getGrades_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetGradesRequest> request) async {
    return getGrades(call, await request);
  }

  $async.Future<$0.LoginEchoResponse> loginEcho_Pre($grpc.ServiceCall call,
      $async.Future<$0.LoginEchoRequest> request) async {
    return loginEcho(call, await request);
  }

  $async.Future<$0.GetProfileResponse> getProfile_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$0.GetMyScoresResponse> getMyScores(
      $grpc.ServiceCall call, $0.GetMyScoresRequest request);
  $async.Future<$0.GetHomeContentResponse> getHomeContent(
      $grpc.ServiceCall call, $0.GetHomeContentRequest request);
  $async.Future<$0.AddScoreResponse> addScore(
      $grpc.ServiceCall call, $0.AddScoreRequest request);
  $async.Future<$0.GetContentResponse> getContent(
      $grpc.ServiceCall call, $0.GetContentRequest request);
  $async.Future<$0.GetGradesResponse> getGrades(
      $grpc.ServiceCall call, $0.GetGradesRequest request);
  $async.Future<$0.LoginEchoResponse> loginEcho(
      $grpc.ServiceCall call, $0.LoginEchoRequest request);
  $async.Future<$0.GetProfileResponse> getProfile(
      $grpc.ServiceCall call, $0.GetProfileRequest request);
}

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
  static final _$getScores =
      $grpc.ClientMethod<$0.GetScoresRequest, $0.GetScoresResponse>(
          '/Scores.V1.ScoresService/GetScores',
          ($0.GetScoresRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetScoresResponse.fromBuffer(value));
  static final _$getGames =
      $grpc.ClientMethod<$0.GetGamesRequest, $0.GetGamesResponse>(
          '/Scores.V1.ScoresService/GetGames',
          ($0.GetGamesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetGamesResponse.fromBuffer(value));

  ScoresServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetScoresResponse> getScores(
      $0.GetScoresRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getScores, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGamesResponse> getGames($0.GetGamesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGames, request, options: options);
  }
}

abstract class ScoresServiceBase extends $grpc.Service {
  $core.String get $name => 'Scores.V1.ScoresService';

  ScoresServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetScoresRequest, $0.GetScoresResponse>(
        'GetScores',
        getScores_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetScoresRequest.fromBuffer(value),
        ($0.GetScoresResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGamesRequest, $0.GetGamesResponse>(
        'GetGames',
        getGames_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGamesRequest.fromBuffer(value),
        ($0.GetGamesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetScoresResponse> getScores_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetScoresRequest> request) async {
    return getScores(call, await request);
  }

  $async.Future<$0.GetGamesResponse> getGames_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetGamesRequest> request) async {
    return getGames(call, await request);
  }

  $async.Future<$0.GetScoresResponse> getScores(
      $grpc.ServiceCall call, $0.GetScoresRequest request);
  $async.Future<$0.GetGamesResponse> getGames(
      $grpc.ServiceCall call, $0.GetGamesRequest request);
}

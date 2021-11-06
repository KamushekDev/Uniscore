///
//  Generated code. Do not modify.
//  source: Scores.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use gradeDescriptor instead')
const Grade$json = const {
  '1': 'Grade',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Grade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gradeDescriptor = $convert.base64Decode('CgVHcmFkZRIOCgJpZBgBIAEoA1ICaWQSFAoFdmFsdWUYAiABKAVSBXZhbHVlEhIKBG5hbWUYAyABKAlSBG5hbWU=');
@$core.Deprecated('Use gameDescriptor instead')
const Game$json = const {
  '1': 'Game',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'score', '3': 3, '4': 1, '5': 11, '6': '.Scores.V1.Grade', '10': 'score'},
    const {'1': 'average', '3': 4, '4': 1, '5': 1, '10': 'average'},
  ],
};

/// Descriptor for `Game`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDescriptor = $convert.base64Decode('CgRHYW1lEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiYKBXNjb3JlGAMgASgLMhAuU2NvcmVzLlYxLkdyYWRlUgVzY29yZRIYCgdhdmVyYWdlGAQgASgBUgdhdmVyYWdl');
@$core.Deprecated('Use getScoresRequestDescriptor instead')
const GetScoresRequest$json = const {
  '1': 'GetScoresRequest',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetScoresRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScoresRequestDescriptor = $convert.base64Decode('ChBHZXRTY29yZXNSZXF1ZXN0EhQKBWNvdW50GAEgASgFUgVjb3VudA==');
@$core.Deprecated('Use getScoresResponseDescriptor instead')
const GetScoresResponse$json = const {
  '1': 'GetScoresResponse',
  '2': const [
    const {'1': 'grades', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.Grade', '10': 'grades'},
  ],
};

/// Descriptor for `GetScoresResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScoresResponseDescriptor = $convert.base64Decode('ChFHZXRTY29yZXNSZXNwb25zZRIoCgZncmFkZXMYASADKAsyEC5TY29yZXMuVjEuR3JhZGVSBmdyYWRlcw==');
@$core.Deprecated('Use getGamesRequestDescriptor instead')
const GetGamesRequest$json = const {
  '1': 'GetGamesRequest',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `GetGamesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesRequestDescriptor = $convert.base64Decode('Cg9HZXRHYW1lc1JlcXVlc3QSFAoFY291bnQYASABKAVSBWNvdW50');
@$core.Deprecated('Use getGamesResponseDescriptor instead')
const GetGamesResponse$json = const {
  '1': 'GetGamesResponse',
  '2': const [
    const {'1': 'games', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.Game', '10': 'games'},
  ],
};

/// Descriptor for `GetGamesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGamesResponseDescriptor = $convert.base64Decode('ChBHZXRHYW1lc1Jlc3BvbnNlEiUKBWdhbWVzGAEgAygLMg8uU2NvcmVzLlYxLkdhbWVSBWdhbWVz');

///
//  Generated code. Do not modify.
//  source: Scores.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use contentTypeDescriptor instead')
const ContentType$json = const {
  '1': 'ContentType',
  '2': const [
    const {'1': 'Game', '2': 0},
    const {'1': 'Movie', '2': 1},
    const {'1': 'Video', '2': 2},
    const {'1': 'Song', '2': 3},
  ],
};

/// Descriptor for `ContentType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List contentTypeDescriptor = $convert.base64Decode('CgtDb250ZW50VHlwZRIICgRHYW1lEAASCQoFTW92aWUQARIJCgVWaWRlbxACEggKBFNvbmcQAw==');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use gradeDescriptor instead')
const Grade$json = const {
  '1': 'Grade',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'gradeSystemId', '3': 3, '4': 1, '5': 3, '10': 'gradeSystemId'},
    const {'1': 'gradeSystemName', '3': 4, '4': 1, '5': 9, '10': 'gradeSystemName'},
  ],
};

/// Descriptor for `Grade`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gradeDescriptor = $convert.base64Decode('CgVHcmFkZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIkCg1ncmFkZVN5c3RlbUlkGAMgASgDUg1ncmFkZVN5c3RlbUlkEigKD2dyYWRlU3lzdGVtTmFtZRgEIAEoCVIPZ3JhZGVTeXN0ZW1OYW1l');
@$core.Deprecated('Use contentDescriptor instead')
const Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.Scores.V1.ContentType', '10': 'type'},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Content`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentDescriptor = $convert.base64Decode('CgdDb250ZW50Eg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEioKBHR5cGUYAyABKA4yFi5TY29yZXMuVjEuQ29udGVudFR5cGVSBHR5cGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use gradedContentDescriptor instead')
const GradedContent$json = const {
  '1': 'GradedContent',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.Scores.V1.User', '10': 'user'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.Scores.V1.Content', '10': 'content'},
    const {'1': 'grade', '3': 3, '4': 3, '5': 11, '6': '.Scores.V1.Grade', '10': 'grade'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `GradedContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gradedContentDescriptor = $convert.base64Decode('Cg1HcmFkZWRDb250ZW50EiMKBHVzZXIYASABKAsyDy5TY29yZXMuVjEuVXNlclIEdXNlchIsCgdjb250ZW50GAIgASgLMhIuU2NvcmVzLlYxLkNvbnRlbnRSB2NvbnRlbnQSJgoFZ3JhZGUYAyADKAsyEC5TY29yZXMuVjEuR3JhZGVSBWdyYWRlEhwKCXRpbWVzdGFtcBgEIAEoA1IJdGltZXN0YW1w');
@$core.Deprecated('Use getMyScoresRequestDescriptor instead')
const GetMyScoresRequest$json = const {
  '1': 'GetMyScoresRequest',
};

/// Descriptor for `GetMyScoresRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyScoresRequestDescriptor = $convert.base64Decode('ChJHZXRNeVNjb3Jlc1JlcXVlc3Q=');
@$core.Deprecated('Use getMyScoresResponseDescriptor instead')
const GetMyScoresResponse$json = const {
  '1': 'GetMyScoresResponse',
  '2': const [
    const {'1': 'gradedContentList', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.GradedContent', '10': 'gradedContentList'},
  ],
};

/// Descriptor for `GetMyScoresResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyScoresResponseDescriptor = $convert.base64Decode('ChNHZXRNeVNjb3Jlc1Jlc3BvbnNlEkYKEWdyYWRlZENvbnRlbnRMaXN0GAEgAygLMhguU2NvcmVzLlYxLkdyYWRlZENvbnRlbnRSEWdyYWRlZENvbnRlbnRMaXN0');
@$core.Deprecated('Use getHomeContentRequestDescriptor instead')
const GetHomeContentRequest$json = const {
  '1': 'GetHomeContentRequest',
};

/// Descriptor for `GetHomeContentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeContentRequestDescriptor = $convert.base64Decode('ChVHZXRIb21lQ29udGVudFJlcXVlc3Q=');
@$core.Deprecated('Use getHomeContentResponseDescriptor instead')
const GetHomeContentResponse$json = const {
  '1': 'GetHomeContentResponse',
  '2': const [
    const {'1': 'gradedContentList', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.GradedContent', '10': 'gradedContentList'},
  ],
};

/// Descriptor for `GetHomeContentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeContentResponseDescriptor = $convert.base64Decode('ChZHZXRIb21lQ29udGVudFJlc3BvbnNlEkYKEWdyYWRlZENvbnRlbnRMaXN0GAEgAygLMhguU2NvcmVzLlYxLkdyYWRlZENvbnRlbnRSEWdyYWRlZENvbnRlbnRMaXN0');
@$core.Deprecated('Use getContentRequestDescriptor instead')
const GetContentRequest$json = const {
  '1': 'GetContentRequest',
};

/// Descriptor for `GetContentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContentRequestDescriptor = $convert.base64Decode('ChFHZXRDb250ZW50UmVxdWVzdA==');
@$core.Deprecated('Use getContentResponseDescriptor instead')
const GetContentResponse$json = const {
  '1': 'GetContentResponse',
  '2': const [
    const {'1': 'contentList', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.Content', '10': 'contentList'},
  ],
};

/// Descriptor for `GetContentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContentResponseDescriptor = $convert.base64Decode('ChJHZXRDb250ZW50UmVzcG9uc2USNAoLY29udGVudExpc3QYASADKAsyEi5TY29yZXMuVjEuQ29udGVudFILY29udGVudExpc3Q=');
@$core.Deprecated('Use addScoreRequestDescriptor instead')
const AddScoreRequest$json = const {
  '1': 'AddScoreRequest',
  '2': const [
    const {'1': 'contentId', '3': 1, '4': 1, '5': 3, '10': 'contentId'},
    const {'1': 'gradeId', '3': 2, '4': 1, '5': 3, '10': 'gradeId'},
  ],
};

/// Descriptor for `AddScoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addScoreRequestDescriptor = $convert.base64Decode('Cg9BZGRTY29yZVJlcXVlc3QSHAoJY29udGVudElkGAEgASgDUgljb250ZW50SWQSGAoHZ3JhZGVJZBgCIAEoA1IHZ3JhZGVJZA==');
@$core.Deprecated('Use addScoreResponseDescriptor instead')
const AddScoreResponse$json = const {
  '1': 'AddScoreResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddScoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addScoreResponseDescriptor = $convert.base64Decode('ChBBZGRTY29yZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use getGradesRequestDescriptor instead')
const GetGradesRequest$json = const {
  '1': 'GetGradesRequest',
};

/// Descriptor for `GetGradesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGradesRequestDescriptor = $convert.base64Decode('ChBHZXRHcmFkZXNSZXF1ZXN0');
@$core.Deprecated('Use getGradesResponseDescriptor instead')
const GetGradesResponse$json = const {
  '1': 'GetGradesResponse',
  '2': const [
    const {'1': 'grades', '3': 1, '4': 3, '5': 11, '6': '.Scores.V1.Grade', '10': 'grades'},
  ],
};

/// Descriptor for `GetGradesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGradesResponseDescriptor = $convert.base64Decode('ChFHZXRHcmFkZXNSZXNwb25zZRIoCgZncmFkZXMYASADKAsyEC5TY29yZXMuVjEuR3JhZGVSBmdyYWRlcw==');
@$core.Deprecated('Use loginEchoRequestDescriptor instead')
const LoginEchoRequest$json = const {
  '1': 'LoginEchoRequest',
};

/// Descriptor for `LoginEchoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginEchoRequestDescriptor = $convert.base64Decode('ChBMb2dpbkVjaG9SZXF1ZXN0');
@$core.Deprecated('Use loginEchoResponseDescriptor instead')
const LoginEchoResponse$json = const {
  '1': 'LoginEchoResponse',
};

/// Descriptor for `LoginEchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginEchoResponseDescriptor = $convert.base64Decode('ChFMb2dpbkVjaG9SZXNwb25zZQ==');
@$core.Deprecated('Use getProfileRequestDescriptor instead')
const GetProfileRequest$json = const {
  '1': 'GetProfileRequest',
};

/// Descriptor for `GetProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileRequestDescriptor = $convert.base64Decode('ChFHZXRQcm9maWxlUmVxdWVzdA==');
@$core.Deprecated('Use gradeSystemDescriptor instead')
const GradeSystem$json = const {
  '1': 'GradeSystem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.Scores.V1.User', '10': 'user'},
    const {'1': 'grades', '3': 3, '4': 3, '5': 11, '6': '.Scores.V1.Grade', '10': 'grades'},
  ],
};

/// Descriptor for `GradeSystem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gradeSystemDescriptor = $convert.base64Decode('CgtHcmFkZVN5c3RlbRIOCgJpZBgBIAEoA1ICaWQSIwoEdXNlchgCIAEoCzIPLlNjb3Jlcy5WMS5Vc2VyUgR1c2VyEigKBmdyYWRlcxgDIAMoCzIQLlNjb3Jlcy5WMS5HcmFkZVIGZ3JhZGVz');
@$core.Deprecated('Use getProfileResponseDescriptor instead')
const GetProfileResponse$json = const {
  '1': 'GetProfileResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.Scores.V1.User', '10': 'user'},
    const {'1': 'subscribersCount', '3': 2, '4': 1, '5': 5, '10': 'subscribersCount'},
    const {'1': 'subscriptionsCount', '3': 3, '4': 1, '5': 5, '10': 'subscriptionsCount'},
    const {'1': 'info', '3': 4, '4': 1, '5': 9, '10': 'info'},
    const {'1': 'userGrades', '3': 5, '4': 3, '5': 11, '6': '.Scores.V1.GradedContent', '10': 'userGrades'},
    const {'1': 'gradeSystem', '3': 6, '4': 3, '5': 11, '6': '.Scores.V1.GradeSystem', '10': 'gradeSystem'},
  ],
};

/// Descriptor for `GetProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileResponseDescriptor = $convert.base64Decode('ChJHZXRQcm9maWxlUmVzcG9uc2USIwoEdXNlchgBIAEoCzIPLlNjb3Jlcy5WMS5Vc2VyUgR1c2VyEioKEHN1YnNjcmliZXJzQ291bnQYAiABKAVSEHN1YnNjcmliZXJzQ291bnQSLgoSc3Vic2NyaXB0aW9uc0NvdW50GAMgASgFUhJzdWJzY3JpcHRpb25zQ291bnQSEgoEaW5mbxgEIAEoCVIEaW5mbxI4Cgp1c2VyR3JhZGVzGAUgAygLMhguU2NvcmVzLlYxLkdyYWRlZENvbnRlbnRSCnVzZXJHcmFkZXMSOAoLZ3JhZGVTeXN0ZW0YBiADKAsyFi5TY29yZXMuVjEuR3JhZGVTeXN0ZW1SC2dyYWRlU3lzdGVt');

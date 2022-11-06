///
//  Generated code. Do not modify.
//  source: BFF.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getUserProfileRequestDescriptor instead')
const GetUserProfileRequest$json = const {
  '1': 'GetUserProfileRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'userId'},
  ],
};

/// Descriptor for `GetUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileRequestDescriptor = $convert.base64Decode('ChVHZXRVc2VyUHJvZmlsZVJlcXVlc3QSNQoHdXNlcl9pZBgBIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIGdXNlcklk');
@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse$json = const {
  '1': 'GetUserProfileResponse',
  '2': const [
    const {'1': 'self_profile', '3': 1, '4': 1, '5': 11, '6': '.BFF.Mobile.V1.GetUserProfileResponse.SelfProfile', '9': 0, '10': 'selfProfile'},
    const {'1': 'other_profile', '3': 2, '4': 1, '5': 11, '6': '.BFF.Mobile.V1.GetUserProfileResponse.OtherProfile', '9': 0, '10': 'otherProfile'},
  ],
  '3': const [GetUserProfileResponse_SelfProfile$json, GetUserProfileResponse_OtherProfile$json, GetUserProfileResponse_Grade$json],
  '8': const [
    const {'1': 'profile'},
  ],
};

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse_SelfProfile$json = const {
  '1': 'SelfProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'followers', '3': 3, '4': 1, '5': 5, '10': 'followers'},
    const {'1': 'following', '3': 4, '4': 1, '5': 5, '10': 'following'},
    const {'1': 'photo_url', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'photoUrl'},
    const {'1': 'background_photo_url', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'backgroundPhotoUrl'},
    const {'1': 'recent_grades', '3': 7, '4': 3, '5': 11, '6': '.BFF.Mobile.V1.GetUserProfileResponse.Grade', '10': 'recentGrades'},
    const {'1': 'profile_information', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'profileInformation'},
  ],
  '9': const [
    const {'1': 9, '2': 10},
    const {'1': 10, '2': 12},
  ],
};

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse_OtherProfile$json = const {
  '1': 'OtherProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'followers', '3': 3, '4': 1, '5': 5, '10': 'followers'},
    const {'1': 'following', '3': 4, '4': 1, '5': 5, '10': 'following'},
    const {'1': 'photo_url', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'photoUrl'},
    const {'1': 'background_photo_url', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'backgroundPhotoUrl'},
    const {'1': 'recent_grades', '3': 7, '4': 3, '5': 11, '6': '.BFF.Mobile.V1.GetUserProfileResponse.Grade', '10': 'recentGrades'},
    const {'1': 'profile_information', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'profileInformation'},
    const {'1': 'is_user_subscribed', '3': 10, '4': 1, '5': 8, '10': 'isUserSubscribed'},
    const {'1': 'is_subscribed_to_user', '3': 11, '4': 1, '5': 8, '10': 'isSubscribedToUser'},
  ],
  '9': const [
    const {'1': 9, '2': 10},
  ],
};

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse_Grade$json = const {
  '1': 'Grade',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `GetUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileResponseDescriptor = $convert.base64Decode('ChZHZXRVc2VyUHJvZmlsZVJlc3BvbnNlElYKDHNlbGZfcHJvZmlsZRgBIAEoCzIxLkJGRi5Nb2JpbGUuVjEuR2V0VXNlclByb2ZpbGVSZXNwb25zZS5TZWxmUHJvZmlsZUgAUgtzZWxmUHJvZmlsZRJZCg1vdGhlcl9wcm9maWxlGAIgASgLMjIuQkZGLk1vYmlsZS5WMS5HZXRVc2VyUHJvZmlsZVJlc3BvbnNlLk90aGVyUHJvZmlsZUgAUgxvdGhlclByb2ZpbGUatAMKC1NlbGZQcm9maWxlEg4KAmlkGAEgASgJUgJpZBIhCgxkaXNwbGF5X25hbWUYAiABKAlSC2Rpc3BsYXlOYW1lEhwKCWZvbGxvd2VycxgDIAEoBVIJZm9sbG93ZXJzEhwKCWZvbGxvd2luZxgEIAEoBVIJZm9sbG93aW5nEjkKCXBob3RvX3VybBgFIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIIcGhvdG9VcmwSTgoUYmFja2dyb3VuZF9waG90b191cmwYBiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSEmJhY2tncm91bmRQaG90b1VybBJQCg1yZWNlbnRfZ3JhZGVzGAcgAygLMisuQkZGLk1vYmlsZS5WMS5HZXRVc2VyUHJvZmlsZVJlc3BvbnNlLkdyYWRlUgxyZWNlbnRHcmFkZXMSTQoTcHJvZmlsZV9pbmZvcm1hdGlvbhgIIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIScHJvZmlsZUluZm9ybWF0aW9uSgQICRAKSgQIChAMGpAECgxPdGhlclByb2ZpbGUSDgoCaWQYASABKAlSAmlkEiEKDGRpc3BsYXlfbmFtZRgCIAEoCVILZGlzcGxheU5hbWUSHAoJZm9sbG93ZXJzGAMgASgFUglmb2xsb3dlcnMSHAoJZm9sbG93aW5nGAQgASgFUglmb2xsb3dpbmcSOQoJcGhvdG9fdXJsGAUgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUghwaG90b1VybBJOChRiYWNrZ3JvdW5kX3Bob3RvX3VybBgGIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVISYmFja2dyb3VuZFBob3RvVXJsElAKDXJlY2VudF9ncmFkZXMYByADKAsyKy5CRkYuTW9iaWxlLlYxLkdldFVzZXJQcm9maWxlUmVzcG9uc2UuR3JhZGVSDHJlY2VudEdyYWRlcxJNChNwcm9maWxlX2luZm9ybWF0aW9uGAggASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUhJwcm9maWxlSW5mb3JtYXRpb24SLAoSaXNfdXNlcl9zdWJzY3JpYmVkGAogASgIUhBpc1VzZXJTdWJzY3JpYmVkEjEKFWlzX3N1YnNjcmliZWRfdG9fdXNlchgLIAEoCFISaXNTdWJzY3JpYmVkVG9Vc2VySgQICRAKGnoKBUdyYWRlEg4KAmlkGAEgASgJUgJpZBI5CgpjcmVhdGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EhIKBG5hbWUYAyABKAlSBG5hbWUSEgoEdHlwZRgEIAEoCVIEdHlwZUIJCgdwcm9maWxl');
@$core.Deprecated('Use getUserGradesRequestDescriptor instead')
const GetUserGradesRequest$json = const {
  '1': 'GetUserGradesRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'userId'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetUserGradesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserGradesRequestDescriptor = $convert.base64Decode('ChRHZXRVc2VyR3JhZGVzUmVxdWVzdBI1Cgd1c2VyX2lkGAEgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUgZ1c2VySWQSFgoGb2Zmc2V0GAIgASgFUgZvZmZzZXQ=');
@$core.Deprecated('Use getUserGradesResponseDescriptor instead')
const GetUserGradesResponse$json = const {
  '1': 'GetUserGradesResponse',
};

/// Descriptor for `GetUserGradesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserGradesResponseDescriptor = $convert.base64Decode('ChVHZXRVc2VyR3JhZGVzUmVzcG9uc2U=');

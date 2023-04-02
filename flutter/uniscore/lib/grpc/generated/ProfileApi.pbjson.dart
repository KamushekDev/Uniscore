///
//  Generated code. Do not modify.
//  source: ProfileApi.proto
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
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileRequestDescriptor = $convert.base64Decode('ChVHZXRVc2VyUHJvZmlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');
@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse$json = const {
  '1': 'GetUserProfileResponse',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'display_name', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'displayName'},
    const {'1': 'photo_url', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'photoUrl'},
    const {'1': 'disabled', '3': 4, '4': 1, '5': 8, '10': 'disabled'},
  ],
};

/// Descriptor for `GetUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileResponseDescriptor = $convert.base64Decode('ChZHZXRVc2VyUHJvZmlsZVJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBI/CgxkaXNwbGF5X25hbWUYAiABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSC2Rpc3BsYXlOYW1lEjkKCXBob3RvX3VybBgDIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZVIIcGhvdG9VcmwSGgoIZGlzYWJsZWQYBCABKAhSCGRpc2FibGVk');

///
//  Generated code. Do not modify.
//  source: BFF.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/wrappers.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $2;

class GetUserProfileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserProfileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..aOM<$1.StringValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', subBuilder: $1.StringValue.create)
    ..hasRequiredFields = false
  ;

  GetUserProfileRequest._() : super();
  factory GetUserProfileRequest({
    $1.StringValue? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetUserProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileRequest clone() => GetUserProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileRequest copyWith(void Function(GetUserProfileRequest) updates) => super.copyWith((message) => updates(message as GetUserProfileRequest)) as GetUserProfileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest create() => GetUserProfileRequest._();
  GetUserProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileRequest> createRepeated() => $pb.PbList<GetUserProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileRequest>(create);
  static GetUserProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StringValue get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($1.StringValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
  @$pb.TagNumber(1)
  $1.StringValue ensureUserId() => $_ensure(0);
}

class GetUserProfileResponse_SelfProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserProfileResponse.SelfProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'followers', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'following', $pb.PbFieldType.O3)
    ..aOM<$1.StringValue>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photoUrl', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backgroundPhotoUrl', subBuilder: $1.StringValue.create)
    ..pc<GetUserProfileResponse_Grade>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recentGrades', $pb.PbFieldType.PM, subBuilder: GetUserProfileResponse_Grade.create)
    ..aOM<$1.StringValue>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profileInformation', subBuilder: $1.StringValue.create)
    ..hasRequiredFields = false
  ;

  GetUserProfileResponse_SelfProfile._() : super();
  factory GetUserProfileResponse_SelfProfile({
    $core.String? id,
    $core.String? displayName,
    $core.int? followers,
    $core.int? following,
    $1.StringValue? photoUrl,
    $1.StringValue? backgroundPhotoUrl,
    $core.Iterable<GetUserProfileResponse_Grade>? recentGrades,
    $1.StringValue? profileInformation,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (followers != null) {
      _result.followers = followers;
    }
    if (following != null) {
      _result.following = following;
    }
    if (photoUrl != null) {
      _result.photoUrl = photoUrl;
    }
    if (backgroundPhotoUrl != null) {
      _result.backgroundPhotoUrl = backgroundPhotoUrl;
    }
    if (recentGrades != null) {
      _result.recentGrades.addAll(recentGrades);
    }
    if (profileInformation != null) {
      _result.profileInformation = profileInformation;
    }
    return _result;
  }
  factory GetUserProfileResponse_SelfProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileResponse_SelfProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_SelfProfile clone() => GetUserProfileResponse_SelfProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_SelfProfile copyWith(void Function(GetUserProfileResponse_SelfProfile) updates) => super.copyWith((message) => updates(message as GetUserProfileResponse_SelfProfile)) as GetUserProfileResponse_SelfProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_SelfProfile create() => GetUserProfileResponse_SelfProfile._();
  GetUserProfileResponse_SelfProfile createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileResponse_SelfProfile> createRepeated() => $pb.PbList<GetUserProfileResponse_SelfProfile>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_SelfProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse_SelfProfile>(create);
  static GetUserProfileResponse_SelfProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get followers => $_getIZ(2);
  @$pb.TagNumber(3)
  set followers($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFollowers() => $_has(2);
  @$pb.TagNumber(3)
  void clearFollowers() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get following => $_getIZ(3);
  @$pb.TagNumber(4)
  set following($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFollowing() => $_has(3);
  @$pb.TagNumber(4)
  void clearFollowing() => clearField(4);

  @$pb.TagNumber(5)
  $1.StringValue get photoUrl => $_getN(4);
  @$pb.TagNumber(5)
  set photoUrl($1.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhotoUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhotoUrl() => clearField(5);
  @$pb.TagNumber(5)
  $1.StringValue ensurePhotoUrl() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.StringValue get backgroundPhotoUrl => $_getN(5);
  @$pb.TagNumber(6)
  set backgroundPhotoUrl($1.StringValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBackgroundPhotoUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearBackgroundPhotoUrl() => clearField(6);
  @$pb.TagNumber(6)
  $1.StringValue ensureBackgroundPhotoUrl() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<GetUserProfileResponse_Grade> get recentGrades => $_getList(6);

  @$pb.TagNumber(8)
  $1.StringValue get profileInformation => $_getN(7);
  @$pb.TagNumber(8)
  set profileInformation($1.StringValue v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasProfileInformation() => $_has(7);
  @$pb.TagNumber(8)
  void clearProfileInformation() => clearField(8);
  @$pb.TagNumber(8)
  $1.StringValue ensureProfileInformation() => $_ensure(7);
}

class GetUserProfileResponse_OtherProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserProfileResponse.OtherProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'followers', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'following', $pb.PbFieldType.O3)
    ..aOM<$1.StringValue>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'photoUrl', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backgroundPhotoUrl', subBuilder: $1.StringValue.create)
    ..pc<GetUserProfileResponse_Grade>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recentGrades', $pb.PbFieldType.PM, subBuilder: GetUserProfileResponse_Grade.create)
    ..aOM<$1.StringValue>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'profileInformation', subBuilder: $1.StringValue.create)
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isUserSubscribed')
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSubscribedToUser')
    ..hasRequiredFields = false
  ;

  GetUserProfileResponse_OtherProfile._() : super();
  factory GetUserProfileResponse_OtherProfile({
    $core.String? id,
    $core.String? displayName,
    $core.int? followers,
    $core.int? following,
    $1.StringValue? photoUrl,
    $1.StringValue? backgroundPhotoUrl,
    $core.Iterable<GetUserProfileResponse_Grade>? recentGrades,
    $1.StringValue? profileInformation,
    $core.bool? isUserSubscribed,
    $core.bool? isSubscribedToUser,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (followers != null) {
      _result.followers = followers;
    }
    if (following != null) {
      _result.following = following;
    }
    if (photoUrl != null) {
      _result.photoUrl = photoUrl;
    }
    if (backgroundPhotoUrl != null) {
      _result.backgroundPhotoUrl = backgroundPhotoUrl;
    }
    if (recentGrades != null) {
      _result.recentGrades.addAll(recentGrades);
    }
    if (profileInformation != null) {
      _result.profileInformation = profileInformation;
    }
    if (isUserSubscribed != null) {
      _result.isUserSubscribed = isUserSubscribed;
    }
    if (isSubscribedToUser != null) {
      _result.isSubscribedToUser = isSubscribedToUser;
    }
    return _result;
  }
  factory GetUserProfileResponse_OtherProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileResponse_OtherProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_OtherProfile clone() => GetUserProfileResponse_OtherProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_OtherProfile copyWith(void Function(GetUserProfileResponse_OtherProfile) updates) => super.copyWith((message) => updates(message as GetUserProfileResponse_OtherProfile)) as GetUserProfileResponse_OtherProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_OtherProfile create() => GetUserProfileResponse_OtherProfile._();
  GetUserProfileResponse_OtherProfile createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileResponse_OtherProfile> createRepeated() => $pb.PbList<GetUserProfileResponse_OtherProfile>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_OtherProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse_OtherProfile>(create);
  static GetUserProfileResponse_OtherProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get followers => $_getIZ(2);
  @$pb.TagNumber(3)
  set followers($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFollowers() => $_has(2);
  @$pb.TagNumber(3)
  void clearFollowers() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get following => $_getIZ(3);
  @$pb.TagNumber(4)
  set following($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFollowing() => $_has(3);
  @$pb.TagNumber(4)
  void clearFollowing() => clearField(4);

  @$pb.TagNumber(5)
  $1.StringValue get photoUrl => $_getN(4);
  @$pb.TagNumber(5)
  set photoUrl($1.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhotoUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhotoUrl() => clearField(5);
  @$pb.TagNumber(5)
  $1.StringValue ensurePhotoUrl() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.StringValue get backgroundPhotoUrl => $_getN(5);
  @$pb.TagNumber(6)
  set backgroundPhotoUrl($1.StringValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBackgroundPhotoUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearBackgroundPhotoUrl() => clearField(6);
  @$pb.TagNumber(6)
  $1.StringValue ensureBackgroundPhotoUrl() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<GetUserProfileResponse_Grade> get recentGrades => $_getList(6);

  @$pb.TagNumber(8)
  $1.StringValue get profileInformation => $_getN(7);
  @$pb.TagNumber(8)
  set profileInformation($1.StringValue v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasProfileInformation() => $_has(7);
  @$pb.TagNumber(8)
  void clearProfileInformation() => clearField(8);
  @$pb.TagNumber(8)
  $1.StringValue ensureProfileInformation() => $_ensure(7);

  @$pb.TagNumber(10)
  $core.bool get isUserSubscribed => $_getBF(8);
  @$pb.TagNumber(10)
  set isUserSubscribed($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsUserSubscribed() => $_has(8);
  @$pb.TagNumber(10)
  void clearIsUserSubscribed() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isSubscribedToUser => $_getBF(9);
  @$pb.TagNumber(11)
  set isSubscribedToUser($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsSubscribedToUser() => $_has(9);
  @$pb.TagNumber(11)
  void clearIsSubscribedToUser() => clearField(11);
}

class GetUserProfileResponse_Grade extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserProfileResponse.Grade', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $2.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..hasRequiredFields = false
  ;

  GetUserProfileResponse_Grade._() : super();
  factory GetUserProfileResponse_Grade({
    $core.String? id,
    $2.Timestamp? createdAt,
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory GetUserProfileResponse_Grade.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileResponse_Grade.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_Grade clone() => GetUserProfileResponse_Grade()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse_Grade copyWith(void Function(GetUserProfileResponse_Grade) updates) => super.copyWith((message) => updates(message as GetUserProfileResponse_Grade)) as GetUserProfileResponse_Grade; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_Grade create() => GetUserProfileResponse_Grade._();
  GetUserProfileResponse_Grade createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileResponse_Grade> createRepeated() => $pb.PbList<GetUserProfileResponse_Grade>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse_Grade getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse_Grade>(create);
  static GetUserProfileResponse_Grade? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

enum GetUserProfileResponse_Profile {
  selfProfile, 
  otherProfile, 
  notSet
}

class GetUserProfileResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GetUserProfileResponse_Profile> _GetUserProfileResponse_ProfileByTag = {
    1 : GetUserProfileResponse_Profile.selfProfile,
    2 : GetUserProfileResponse_Profile.otherProfile,
    0 : GetUserProfileResponse_Profile.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<GetUserProfileResponse_SelfProfile>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'selfProfile', subBuilder: GetUserProfileResponse_SelfProfile.create)
    ..aOM<GetUserProfileResponse_OtherProfile>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otherProfile', subBuilder: GetUserProfileResponse_OtherProfile.create)
    ..hasRequiredFields = false
  ;

  GetUserProfileResponse._() : super();
  factory GetUserProfileResponse({
    GetUserProfileResponse_SelfProfile? selfProfile,
    GetUserProfileResponse_OtherProfile? otherProfile,
  }) {
    final _result = create();
    if (selfProfile != null) {
      _result.selfProfile = selfProfile;
    }
    if (otherProfile != null) {
      _result.otherProfile = otherProfile;
    }
    return _result;
  }
  factory GetUserProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse clone() => GetUserProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserProfileResponse copyWith(void Function(GetUserProfileResponse) updates) => super.copyWith((message) => updates(message as GetUserProfileResponse)) as GetUserProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse create() => GetUserProfileResponse._();
  GetUserProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserProfileResponse> createRepeated() => $pb.PbList<GetUserProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse>(create);
  static GetUserProfileResponse? _defaultInstance;

  GetUserProfileResponse_Profile whichProfile() => _GetUserProfileResponse_ProfileByTag[$_whichOneof(0)]!;
  void clearProfile() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetUserProfileResponse_SelfProfile get selfProfile => $_getN(0);
  @$pb.TagNumber(1)
  set selfProfile(GetUserProfileResponse_SelfProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSelfProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelfProfile() => clearField(1);
  @$pb.TagNumber(1)
  GetUserProfileResponse_SelfProfile ensureSelfProfile() => $_ensure(0);

  @$pb.TagNumber(2)
  GetUserProfileResponse_OtherProfile get otherProfile => $_getN(1);
  @$pb.TagNumber(2)
  set otherProfile(GetUserProfileResponse_OtherProfile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtherProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearOtherProfile() => clearField(2);
  @$pb.TagNumber(2)
  GetUserProfileResponse_OtherProfile ensureOtherProfile() => $_ensure(1);
}

class GetUserGradesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserGradesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..aOM<$1.StringValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', subBuilder: $1.StringValue.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetUserGradesRequest._() : super();
  factory GetUserGradesRequest({
    $1.StringValue? userId,
    $core.int? offset,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    return _result;
  }
  factory GetUserGradesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserGradesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserGradesRequest clone() => GetUserGradesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserGradesRequest copyWith(void Function(GetUserGradesRequest) updates) => super.copyWith((message) => updates(message as GetUserGradesRequest)) as GetUserGradesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserGradesRequest create() => GetUserGradesRequest._();
  GetUserGradesRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserGradesRequest> createRepeated() => $pb.PbList<GetUserGradesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserGradesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserGradesRequest>(create);
  static GetUserGradesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.StringValue get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId($1.StringValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
  @$pb.TagNumber(1)
  $1.StringValue ensureUserId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

class GetUserGradesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserGradesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BFF.Mobile.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetUserGradesResponse._() : super();
  factory GetUserGradesResponse() => create();
  factory GetUserGradesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserGradesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserGradesResponse clone() => GetUserGradesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserGradesResponse copyWith(void Function(GetUserGradesResponse) updates) => super.copyWith((message) => updates(message as GetUserGradesResponse)) as GetUserGradesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserGradesResponse create() => GetUserGradesResponse._();
  GetUserGradesResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserGradesResponse> createRepeated() => $pb.PbList<GetUserGradesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserGradesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserGradesResponse>(create);
  static GetUserGradesResponse? _defaultInstance;
}


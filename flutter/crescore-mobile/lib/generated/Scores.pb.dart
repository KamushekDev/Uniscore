///
//  Generated code. Do not modify.
//  source: Scores.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Scores.pbenum.dart';

export 'Scores.pbenum.dart';

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Grade extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Grade', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradeSystemId', protoName: 'gradeSystemId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradeSystemName', protoName: 'gradeSystemName')
    ..hasRequiredFields = false
  ;

  Grade._() : super();
  factory Grade({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? gradeSystemId,
    $core.String? gradeSystemName,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (gradeSystemId != null) {
      _result.gradeSystemId = gradeSystemId;
    }
    if (gradeSystemName != null) {
      _result.gradeSystemName = gradeSystemName;
    }
    return _result;
  }
  factory Grade.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Grade.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Grade clone() => Grade()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Grade copyWith(void Function(Grade) updates) => super.copyWith((message) => updates(message as Grade)) as Grade; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Grade create() => Grade._();
  Grade createEmptyInstance() => create();
  static $pb.PbList<Grade> createRepeated() => $pb.PbList<Grade>();
  @$core.pragma('dart2js:noInline')
  static Grade getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Grade>(create);
  static Grade? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get gradeSystemId => $_getI64(2);
  @$pb.TagNumber(3)
  set gradeSystemId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGradeSystemId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGradeSystemId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gradeSystemName => $_getSZ(3);
  @$pb.TagNumber(4)
  set gradeSystemName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGradeSystemName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGradeSystemName() => clearField(4);
}

class Content extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Content', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<ContentType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ContentType.Game, valueOf: ContentType.valueOf, enumValues: ContentType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  Content._() : super();
  factory Content({
    $fixnum.Int64? id,
    $core.String? name,
    ContentType? type,
    $core.String? description,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Content clone() => Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Content copyWith(void Function(Content) updates) => super.copyWith((message) => updates(message as Content)) as Content; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Content create() => Content._();
  Content createEmptyInstance() => create();
  static $pb.PbList<Content> createRepeated() => $pb.PbList<Content>();
  @$core.pragma('dart2js:noInline')
  static Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Content>(create);
  static Content? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  ContentType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ContentType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
}

class GradedContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GradedContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..aOM<Content>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: Content.create)
    ..pc<Grade>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grade', $pb.PbFieldType.PM, subBuilder: Grade.create)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  GradedContent._() : super();
  factory GradedContent({
    User? user,
    Content? content,
    $core.Iterable<Grade>? grade,
    $fixnum.Int64? timestamp,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (content != null) {
      _result.content = content;
    }
    if (grade != null) {
      _result.grade.addAll(grade);
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory GradedContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GradedContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GradedContent clone() => GradedContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GradedContent copyWith(void Function(GradedContent) updates) => super.copyWith((message) => updates(message as GradedContent)) as GradedContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GradedContent create() => GradedContent._();
  GradedContent createEmptyInstance() => create();
  static $pb.PbList<GradedContent> createRepeated() => $pb.PbList<GradedContent>();
  @$core.pragma('dart2js:noInline')
  static GradedContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GradedContent>(create);
  static GradedContent? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  Content get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(Content v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  Content ensureContent() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<Grade> get grade => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
}

class GetMyScoresRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetMyScoresRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetMyScoresRequest._() : super();
  factory GetMyScoresRequest() => create();
  factory GetMyScoresRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyScoresRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyScoresRequest clone() => GetMyScoresRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyScoresRequest copyWith(void Function(GetMyScoresRequest) updates) => super.copyWith((message) => updates(message as GetMyScoresRequest)) as GetMyScoresRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetMyScoresRequest create() => GetMyScoresRequest._();
  GetMyScoresRequest createEmptyInstance() => create();
  static $pb.PbList<GetMyScoresRequest> createRepeated() => $pb.PbList<GetMyScoresRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMyScoresRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyScoresRequest>(create);
  static GetMyScoresRequest? _defaultInstance;
}

class GetMyScoresResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetMyScoresResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..pc<GradedContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradedContentList', $pb.PbFieldType.PM, protoName: 'gradedContentList', subBuilder: GradedContent.create)
    ..hasRequiredFields = false
  ;

  GetMyScoresResponse._() : super();
  factory GetMyScoresResponse({
    $core.Iterable<GradedContent>? gradedContentList,
  }) {
    final _result = create();
    if (gradedContentList != null) {
      _result.gradedContentList.addAll(gradedContentList);
    }
    return _result;
  }
  factory GetMyScoresResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyScoresResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyScoresResponse clone() => GetMyScoresResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyScoresResponse copyWith(void Function(GetMyScoresResponse) updates) => super.copyWith((message) => updates(message as GetMyScoresResponse)) as GetMyScoresResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetMyScoresResponse create() => GetMyScoresResponse._();
  GetMyScoresResponse createEmptyInstance() => create();
  static $pb.PbList<GetMyScoresResponse> createRepeated() => $pb.PbList<GetMyScoresResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMyScoresResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyScoresResponse>(create);
  static GetMyScoresResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GradedContent> get gradedContentList => $_getList(0);
}

class GetHomeContentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHomeContentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetHomeContentRequest._() : super();
  factory GetHomeContentRequest() => create();
  factory GetHomeContentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHomeContentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHomeContentRequest clone() => GetHomeContentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHomeContentRequest copyWith(void Function(GetHomeContentRequest) updates) => super.copyWith((message) => updates(message as GetHomeContentRequest)) as GetHomeContentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHomeContentRequest create() => GetHomeContentRequest._();
  GetHomeContentRequest createEmptyInstance() => create();
  static $pb.PbList<GetHomeContentRequest> createRepeated() => $pb.PbList<GetHomeContentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetHomeContentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHomeContentRequest>(create);
  static GetHomeContentRequest? _defaultInstance;
}

class GetHomeContentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetHomeContentResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..pc<GradedContent>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradedContentList', $pb.PbFieldType.PM, protoName: 'gradedContentList', subBuilder: GradedContent.create)
    ..hasRequiredFields = false
  ;

  GetHomeContentResponse._() : super();
  factory GetHomeContentResponse({
    $core.Iterable<GradedContent>? gradedContentList,
  }) {
    final _result = create();
    if (gradedContentList != null) {
      _result.gradedContentList.addAll(gradedContentList);
    }
    return _result;
  }
  factory GetHomeContentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHomeContentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHomeContentResponse clone() => GetHomeContentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHomeContentResponse copyWith(void Function(GetHomeContentResponse) updates) => super.copyWith((message) => updates(message as GetHomeContentResponse)) as GetHomeContentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetHomeContentResponse create() => GetHomeContentResponse._();
  GetHomeContentResponse createEmptyInstance() => create();
  static $pb.PbList<GetHomeContentResponse> createRepeated() => $pb.PbList<GetHomeContentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetHomeContentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHomeContentResponse>(create);
  static GetHomeContentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GradedContent> get gradedContentList => $_getList(0);
}

class GetContentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetContentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetContentRequest._() : super();
  factory GetContentRequest() => create();
  factory GetContentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContentRequest clone() => GetContentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContentRequest copyWith(void Function(GetContentRequest) updates) => super.copyWith((message) => updates(message as GetContentRequest)) as GetContentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetContentRequest create() => GetContentRequest._();
  GetContentRequest createEmptyInstance() => create();
  static $pb.PbList<GetContentRequest> createRepeated() => $pb.PbList<GetContentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetContentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContentRequest>(create);
  static GetContentRequest? _defaultInstance;
}

class GetContentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetContentResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..pc<Content>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentList', $pb.PbFieldType.PM, protoName: 'contentList', subBuilder: Content.create)
    ..hasRequiredFields = false
  ;

  GetContentResponse._() : super();
  factory GetContentResponse({
    $core.Iterable<Content>? contentList,
  }) {
    final _result = create();
    if (contentList != null) {
      _result.contentList.addAll(contentList);
    }
    return _result;
  }
  factory GetContentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContentResponse clone() => GetContentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContentResponse copyWith(void Function(GetContentResponse) updates) => super.copyWith((message) => updates(message as GetContentResponse)) as GetContentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetContentResponse create() => GetContentResponse._();
  GetContentResponse createEmptyInstance() => create();
  static $pb.PbList<GetContentResponse> createRepeated() => $pb.PbList<GetContentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContentResponse>(create);
  static GetContentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Content> get contentList => $_getList(0);
}

class AddScoreRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddScoreRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentId', protoName: 'contentId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradeId', protoName: 'gradeId')
    ..hasRequiredFields = false
  ;

  AddScoreRequest._() : super();
  factory AddScoreRequest({
    $fixnum.Int64? contentId,
    $fixnum.Int64? gradeId,
  }) {
    final _result = create();
    if (contentId != null) {
      _result.contentId = contentId;
    }
    if (gradeId != null) {
      _result.gradeId = gradeId;
    }
    return _result;
  }
  factory AddScoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddScoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddScoreRequest clone() => AddScoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddScoreRequest copyWith(void Function(AddScoreRequest) updates) => super.copyWith((message) => updates(message as AddScoreRequest)) as AddScoreRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddScoreRequest create() => AddScoreRequest._();
  AddScoreRequest createEmptyInstance() => create();
  static $pb.PbList<AddScoreRequest> createRepeated() => $pb.PbList<AddScoreRequest>();
  @$core.pragma('dart2js:noInline')
  static AddScoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddScoreRequest>(create);
  static AddScoreRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get contentId => $_getI64(0);
  @$pb.TagNumber(1)
  set contentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gradeId => $_getI64(1);
  @$pb.TagNumber(2)
  set gradeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGradeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGradeId() => clearField(2);
}

class AddScoreResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddScoreResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  AddScoreResponse._() : super();
  factory AddScoreResponse({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory AddScoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddScoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddScoreResponse clone() => AddScoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddScoreResponse copyWith(void Function(AddScoreResponse) updates) => super.copyWith((message) => updates(message as AddScoreResponse)) as AddScoreResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddScoreResponse create() => AddScoreResponse._();
  AddScoreResponse createEmptyInstance() => create();
  static $pb.PbList<AddScoreResponse> createRepeated() => $pb.PbList<AddScoreResponse>();
  @$core.pragma('dart2js:noInline')
  static AddScoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddScoreResponse>(create);
  static AddScoreResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetGradesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetGradesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetGradesRequest._() : super();
  factory GetGradesRequest() => create();
  factory GetGradesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGradesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGradesRequest clone() => GetGradesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGradesRequest copyWith(void Function(GetGradesRequest) updates) => super.copyWith((message) => updates(message as GetGradesRequest)) as GetGradesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGradesRequest create() => GetGradesRequest._();
  GetGradesRequest createEmptyInstance() => create();
  static $pb.PbList<GetGradesRequest> createRepeated() => $pb.PbList<GetGradesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGradesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGradesRequest>(create);
  static GetGradesRequest? _defaultInstance;
}

class GetGradesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetGradesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..pc<Grade>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grades', $pb.PbFieldType.PM, subBuilder: Grade.create)
    ..hasRequiredFields = false
  ;

  GetGradesResponse._() : super();
  factory GetGradesResponse({
    $core.Iterable<Grade>? grades,
  }) {
    final _result = create();
    if (grades != null) {
      _result.grades.addAll(grades);
    }
    return _result;
  }
  factory GetGradesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGradesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGradesResponse clone() => GetGradesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGradesResponse copyWith(void Function(GetGradesResponse) updates) => super.copyWith((message) => updates(message as GetGradesResponse)) as GetGradesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGradesResponse create() => GetGradesResponse._();
  GetGradesResponse createEmptyInstance() => create();
  static $pb.PbList<GetGradesResponse> createRepeated() => $pb.PbList<GetGradesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGradesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGradesResponse>(create);
  static GetGradesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Grade> get grades => $_getList(0);
}

class LoginEchoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginEchoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoginEchoRequest._() : super();
  factory LoginEchoRequest() => create();
  factory LoginEchoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginEchoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginEchoRequest clone() => LoginEchoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginEchoRequest copyWith(void Function(LoginEchoRequest) updates) => super.copyWith((message) => updates(message as LoginEchoRequest)) as LoginEchoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginEchoRequest create() => LoginEchoRequest._();
  LoginEchoRequest createEmptyInstance() => create();
  static $pb.PbList<LoginEchoRequest> createRepeated() => $pb.PbList<LoginEchoRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginEchoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginEchoRequest>(create);
  static LoginEchoRequest? _defaultInstance;
}

class LoginEchoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginEchoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoginEchoResponse._() : super();
  factory LoginEchoResponse() => create();
  factory LoginEchoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginEchoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginEchoResponse clone() => LoginEchoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginEchoResponse copyWith(void Function(LoginEchoResponse) updates) => super.copyWith((message) => updates(message as LoginEchoResponse)) as LoginEchoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginEchoResponse create() => LoginEchoResponse._();
  LoginEchoResponse createEmptyInstance() => create();
  static $pb.PbList<LoginEchoResponse> createRepeated() => $pb.PbList<LoginEchoResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginEchoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginEchoResponse>(create);
  static LoginEchoResponse? _defaultInstance;
}

class GetProfileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetProfileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetProfileRequest._() : super();
  factory GetProfileRequest() => create();
  factory GetProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileRequest clone() => GetProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileRequest copyWith(void Function(GetProfileRequest) updates) => super.copyWith((message) => updates(message as GetProfileRequest)) as GetProfileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetProfileRequest create() => GetProfileRequest._();
  GetProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetProfileRequest> createRepeated() => $pb.PbList<GetProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileRequest>(create);
  static GetProfileRequest? _defaultInstance;
}

class GradeSystem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GradeSystem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<User>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..pc<Grade>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grades', $pb.PbFieldType.PM, subBuilder: Grade.create)
    ..hasRequiredFields = false
  ;

  GradeSystem._() : super();
  factory GradeSystem({
    $fixnum.Int64? id,
    User? user,
    $core.Iterable<Grade>? grades,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (user != null) {
      _result.user = user;
    }
    if (grades != null) {
      _result.grades.addAll(grades);
    }
    return _result;
  }
  factory GradeSystem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GradeSystem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GradeSystem clone() => GradeSystem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GradeSystem copyWith(void Function(GradeSystem) updates) => super.copyWith((message) => updates(message as GradeSystem)) as GradeSystem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GradeSystem create() => GradeSystem._();
  GradeSystem createEmptyInstance() => create();
  static $pb.PbList<GradeSystem> createRepeated() => $pb.PbList<GradeSystem>();
  @$core.pragma('dart2js:noInline')
  static GradeSystem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GradeSystem>(create);
  static GradeSystem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  User ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<Grade> get grades => $_getList(2);
}

class GetProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scores.V1'), createEmptyInstance: create)
    ..aOM<User>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: User.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribersCount', $pb.PbFieldType.O3, protoName: 'subscribersCount')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscriptionsCount', $pb.PbFieldType.O3, protoName: 'subscriptionsCount')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info')
    ..pc<GradedContent>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userGrades', $pb.PbFieldType.PM, protoName: 'userGrades', subBuilder: GradedContent.create)
    ..pc<GradeSystem>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gradeSystem', $pb.PbFieldType.PM, protoName: 'gradeSystem', subBuilder: GradeSystem.create)
    ..hasRequiredFields = false
  ;

  GetProfileResponse._() : super();
  factory GetProfileResponse({
    User? user,
    $core.int? subscribersCount,
    $core.int? subscriptionsCount,
    $core.String? info,
    $core.Iterable<GradedContent>? userGrades,
    $core.Iterable<GradeSystem>? gradeSystem,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (subscribersCount != null) {
      _result.subscribersCount = subscribersCount;
    }
    if (subscriptionsCount != null) {
      _result.subscriptionsCount = subscriptionsCount;
    }
    if (info != null) {
      _result.info = info;
    }
    if (userGrades != null) {
      _result.userGrades.addAll(userGrades);
    }
    if (gradeSystem != null) {
      _result.gradeSystem.addAll(gradeSystem);
    }
    return _result;
  }
  factory GetProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileResponse clone() => GetProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileResponse copyWith(void Function(GetProfileResponse) updates) => super.copyWith((message) => updates(message as GetProfileResponse)) as GetProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetProfileResponse create() => GetProfileResponse._();
  GetProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfileResponse> createRepeated() => $pb.PbList<GetProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileResponse>(create);
  static GetProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get subscribersCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set subscribersCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubscribersCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscribersCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get subscriptionsCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set subscriptionsCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubscriptionsCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscriptionsCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get info => $_getSZ(3);
  @$pb.TagNumber(4)
  set info($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearInfo() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GradedContent> get userGrades => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<GradeSystem> get gradeSystem => $_getList(5);
}


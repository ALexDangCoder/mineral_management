// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProposalPlanModel {
  int? get objectId;
  String? get projectId;
  String? get projectName;
  String? get areaName;
  String? get mineName;
  DateTime? get signDate;
  String? get constructionUnitName;
  int? get phase;
  int? get status;
  String? get approvalUnitName;
  int? get reviewStatus;
  String? get projectInfo;
  String? get note;

  /// Create a copy of ProposalPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProposalPlanModelCopyWith<ProposalPlanModel> get copyWith =>
      _$ProposalPlanModelCopyWithImpl<ProposalPlanModel>(
          this as ProposalPlanModel, _$identity);

  /// Serializes this ProposalPlanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProposalPlanModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.mineName, mineName) ||
                other.mineName == mineName) &&
            (identical(other.signDate, signDate) ||
                other.signDate == signDate) &&
            (identical(other.constructionUnitName, constructionUnitName) ||
                other.constructionUnitName == constructionUnitName) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalUnitName, approvalUnitName) ||
                other.approvalUnitName == approvalUnitName) &&
            (identical(other.reviewStatus, reviewStatus) ||
                other.reviewStatus == reviewStatus) &&
            (identical(other.projectInfo, projectInfo) ||
                other.projectInfo == projectInfo) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      projectId,
      projectName,
      areaName,
      mineName,
      signDate,
      constructionUnitName,
      phase,
      status,
      approvalUnitName,
      reviewStatus,
      projectInfo,
      note);

  @override
  String toString() {
    return 'ProposalPlanModel(objectId: $objectId, projectId: $projectId, projectName: $projectName, areaName: $areaName, mineName: $mineName, signDate: $signDate, constructionUnitName: $constructionUnitName, phase: $phase, status: $status, approvalUnitName: $approvalUnitName, reviewStatus: $reviewStatus, projectInfo: $projectInfo, note: $note)';
  }
}

/// @nodoc
abstract mixin class $ProposalPlanModelCopyWith<$Res> {
  factory $ProposalPlanModelCopyWith(
          ProposalPlanModel value, $Res Function(ProposalPlanModel) _then) =
      _$ProposalPlanModelCopyWithImpl;
  @useResult
  $Res call(
      {int? objectId,
      String? projectId,
      String? projectName,
      String? areaName,
      String? mineName,
      DateTime? signDate,
      String? constructionUnitName,
      int? phase,
      int? status,
      String? approvalUnitName,
      int? reviewStatus,
      String? projectInfo,
      String? note});
}

/// @nodoc
class _$ProposalPlanModelCopyWithImpl<$Res>
    implements $ProposalPlanModelCopyWith<$Res> {
  _$ProposalPlanModelCopyWithImpl(this._self, this._then);

  final ProposalPlanModel _self;
  final $Res Function(ProposalPlanModel) _then;

  /// Create a copy of ProposalPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? areaName = freezed,
    Object? mineName = freezed,
    Object? signDate = freezed,
    Object? constructionUnitName = freezed,
    Object? phase = freezed,
    Object? status = freezed,
    Object? approvalUnitName = freezed,
    Object? reviewStatus = freezed,
    Object? projectInfo = freezed,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      objectId: freezed == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaName: freezed == areaName
          ? _self.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
      mineName: freezed == mineName
          ? _self.mineName
          : mineName // ignore: cast_nullable_to_non_nullable
              as String?,
      signDate: freezed == signDate
          ? _self.signDate
          : signDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      constructionUnitName: freezed == constructionUnitName
          ? _self.constructionUnitName
          : constructionUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      approvalUnitName: freezed == approvalUnitName
          ? _self.approvalUnitName
          : approvalUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewStatus: freezed == reviewStatus
          ? _self.reviewStatus
          : reviewStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      projectInfo: freezed == projectInfo
          ? _self.projectInfo
          : projectInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProposalPlanModel].
extension ProposalPlanModelPatterns on ProposalPlanModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProposalPlanModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProposalPlanModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProposalPlanModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? objectId,
            String? projectId,
            String? projectName,
            String? areaName,
            String? mineName,
            DateTime? signDate,
            String? constructionUnitName,
            int? phase,
            int? status,
            String? approvalUnitName,
            int? reviewStatus,
            String? projectInfo,
            String? note)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel() when $default != null:
        return $default(
            _that.objectId,
            _that.projectId,
            _that.projectName,
            _that.areaName,
            _that.mineName,
            _that.signDate,
            _that.constructionUnitName,
            _that.phase,
            _that.status,
            _that.approvalUnitName,
            _that.reviewStatus,
            _that.projectInfo,
            _that.note);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? objectId,
            String? projectId,
            String? projectName,
            String? areaName,
            String? mineName,
            DateTime? signDate,
            String? constructionUnitName,
            int? phase,
            int? status,
            String? approvalUnitName,
            int? reviewStatus,
            String? projectInfo,
            String? note)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel():
        return $default(
            _that.objectId,
            _that.projectId,
            _that.projectName,
            _that.areaName,
            _that.mineName,
            _that.signDate,
            _that.constructionUnitName,
            _that.phase,
            _that.status,
            _that.approvalUnitName,
            _that.reviewStatus,
            _that.projectInfo,
            _that.note);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? objectId,
            String? projectId,
            String? projectName,
            String? areaName,
            String? mineName,
            DateTime? signDate,
            String? constructionUnitName,
            int? phase,
            int? status,
            String? approvalUnitName,
            int? reviewStatus,
            String? projectInfo,
            String? note)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProposalPlanModel() when $default != null:
        return $default(
            _that.objectId,
            _that.projectId,
            _that.projectName,
            _that.areaName,
            _that.mineName,
            _that.signDate,
            _that.constructionUnitName,
            _that.phase,
            _that.status,
            _that.approvalUnitName,
            _that.reviewStatus,
            _that.projectInfo,
            _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProposalPlanModel implements ProposalPlanModel {
  const _ProposalPlanModel(
      {this.objectId,
      this.projectId,
      this.projectName,
      this.areaName,
      this.mineName,
      this.signDate,
      this.constructionUnitName,
      this.phase,
      this.status,
      this.approvalUnitName,
      this.reviewStatus,
      this.projectInfo,
      this.note});
  factory _ProposalPlanModel.fromJson(Map<String, dynamic> json) =>
      _$ProposalPlanModelFromJson(json);

  @override
  final int? objectId;
  @override
  final String? projectId;
  @override
  final String? projectName;
  @override
  final String? areaName;
  @override
  final String? mineName;
  @override
  final DateTime? signDate;
  @override
  final String? constructionUnitName;
  @override
  final int? phase;
  @override
  final int? status;
  @override
  final String? approvalUnitName;
  @override
  final int? reviewStatus;
  @override
  final String? projectInfo;
  @override
  final String? note;

  /// Create a copy of ProposalPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProposalPlanModelCopyWith<_ProposalPlanModel> get copyWith =>
      __$ProposalPlanModelCopyWithImpl<_ProposalPlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProposalPlanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProposalPlanModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.areaName, areaName) ||
                other.areaName == areaName) &&
            (identical(other.mineName, mineName) ||
                other.mineName == mineName) &&
            (identical(other.signDate, signDate) ||
                other.signDate == signDate) &&
            (identical(other.constructionUnitName, constructionUnitName) ||
                other.constructionUnitName == constructionUnitName) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalUnitName, approvalUnitName) ||
                other.approvalUnitName == approvalUnitName) &&
            (identical(other.reviewStatus, reviewStatus) ||
                other.reviewStatus == reviewStatus) &&
            (identical(other.projectInfo, projectInfo) ||
                other.projectInfo == projectInfo) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      projectId,
      projectName,
      areaName,
      mineName,
      signDate,
      constructionUnitName,
      phase,
      status,
      approvalUnitName,
      reviewStatus,
      projectInfo,
      note);

  @override
  String toString() {
    return 'ProposalPlanModel(objectId: $objectId, projectId: $projectId, projectName: $projectName, areaName: $areaName, mineName: $mineName, signDate: $signDate, constructionUnitName: $constructionUnitName, phase: $phase, status: $status, approvalUnitName: $approvalUnitName, reviewStatus: $reviewStatus, projectInfo: $projectInfo, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$ProposalPlanModelCopyWith<$Res>
    implements $ProposalPlanModelCopyWith<$Res> {
  factory _$ProposalPlanModelCopyWith(
          _ProposalPlanModel value, $Res Function(_ProposalPlanModel) _then) =
      __$ProposalPlanModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? objectId,
      String? projectId,
      String? projectName,
      String? areaName,
      String? mineName,
      DateTime? signDate,
      String? constructionUnitName,
      int? phase,
      int? status,
      String? approvalUnitName,
      int? reviewStatus,
      String? projectInfo,
      String? note});
}

/// @nodoc
class __$ProposalPlanModelCopyWithImpl<$Res>
    implements _$ProposalPlanModelCopyWith<$Res> {
  __$ProposalPlanModelCopyWithImpl(this._self, this._then);

  final _ProposalPlanModel _self;
  final $Res Function(_ProposalPlanModel) _then;

  /// Create a copy of ProposalPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? objectId = freezed,
    Object? projectId = freezed,
    Object? projectName = freezed,
    Object? areaName = freezed,
    Object? mineName = freezed,
    Object? signDate = freezed,
    Object? constructionUnitName = freezed,
    Object? phase = freezed,
    Object? status = freezed,
    Object? approvalUnitName = freezed,
    Object? reviewStatus = freezed,
    Object? projectInfo = freezed,
    Object? note = freezed,
  }) {
    return _then(_ProposalPlanModel(
      objectId: freezed == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _self.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      areaName: freezed == areaName
          ? _self.areaName
          : areaName // ignore: cast_nullable_to_non_nullable
              as String?,
      mineName: freezed == mineName
          ? _self.mineName
          : mineName // ignore: cast_nullable_to_non_nullable
              as String?,
      signDate: freezed == signDate
          ? _self.signDate
          : signDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      constructionUnitName: freezed == constructionUnitName
          ? _self.constructionUnitName
          : constructionUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _self.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      approvalUnitName: freezed == approvalUnitName
          ? _self.approvalUnitName
          : approvalUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewStatus: freezed == reviewStatus
          ? _self.reviewStatus
          : reviewStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      projectInfo: freezed == projectInfo
          ? _self.projectInfo
          : projectInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

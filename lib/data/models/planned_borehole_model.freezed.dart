// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planned_borehole_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlannedBoreholeModel {
  int? get objectId;
  String? get boreholeId;
  String? get boreholeName;
  String? get routeName;
  String? get studyMission;
  double? get constructedDepth;
  int? get completedStatus;
  int? get plannedDepth;
  String? get seamName;
  int? get notStartedStatus;
  int? get inProgressStatus;

  /// Create a copy of PlannedBoreholeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlannedBoreholeModelCopyWith<PlannedBoreholeModel> get copyWith =>
      _$PlannedBoreholeModelCopyWithImpl<PlannedBoreholeModel>(
          this as PlannedBoreholeModel, _$identity);

  /// Serializes this PlannedBoreholeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlannedBoreholeModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.boreholeId, boreholeId) ||
                other.boreholeId == boreholeId) &&
            (identical(other.boreholeName, boreholeName) ||
                other.boreholeName == boreholeName) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.studyMission, studyMission) ||
                other.studyMission == studyMission) &&
            (identical(other.constructedDepth, constructedDepth) ||
                other.constructedDepth == constructedDepth) &&
            (identical(other.completedStatus, completedStatus) ||
                other.completedStatus == completedStatus) &&
            (identical(other.plannedDepth, plannedDepth) ||
                other.plannedDepth == plannedDepth) &&
            (identical(other.seamName, seamName) ||
                other.seamName == seamName) &&
            (identical(other.notStartedStatus, notStartedStatus) ||
                other.notStartedStatus == notStartedStatus) &&
            (identical(other.inProgressStatus, inProgressStatus) ||
                other.inProgressStatus == inProgressStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      boreholeId,
      boreholeName,
      routeName,
      studyMission,
      constructedDepth,
      completedStatus,
      plannedDepth,
      seamName,
      notStartedStatus,
      inProgressStatus);

  @override
  String toString() {
    return 'PlannedBoreholeModel(objectId: $objectId, boreholeId: $boreholeId, boreholeName: $boreholeName, routeName: $routeName, studyMission: $studyMission, constructedDepth: $constructedDepth, completedStatus: $completedStatus, plannedDepth: $plannedDepth, seamName: $seamName, notStartedStatus: $notStartedStatus, inProgressStatus: $inProgressStatus)';
  }
}

/// @nodoc
abstract mixin class $PlannedBoreholeModelCopyWith<$Res> {
  factory $PlannedBoreholeModelCopyWith(PlannedBoreholeModel value,
          $Res Function(PlannedBoreholeModel) _then) =
      _$PlannedBoreholeModelCopyWithImpl;
  @useResult
  $Res call(
      {int? objectId,
      String? boreholeId,
      String? boreholeName,
      String? routeName,
      String? studyMission,
      double? constructedDepth,
      int? completedStatus,
      int? plannedDepth,
      String? seamName,
      int? notStartedStatus,
      int? inProgressStatus});
}

/// @nodoc
class _$PlannedBoreholeModelCopyWithImpl<$Res>
    implements $PlannedBoreholeModelCopyWith<$Res> {
  _$PlannedBoreholeModelCopyWithImpl(this._self, this._then);

  final PlannedBoreholeModel _self;
  final $Res Function(PlannedBoreholeModel) _then;

  /// Create a copy of PlannedBoreholeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? boreholeId = freezed,
    Object? boreholeName = freezed,
    Object? routeName = freezed,
    Object? studyMission = freezed,
    Object? constructedDepth = freezed,
    Object? completedStatus = freezed,
    Object? plannedDepth = freezed,
    Object? seamName = freezed,
    Object? notStartedStatus = freezed,
    Object? inProgressStatus = freezed,
  }) {
    return _then(_self.copyWith(
      objectId: freezed == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      boreholeId: freezed == boreholeId
          ? _self.boreholeId
          : boreholeId // ignore: cast_nullable_to_non_nullable
              as String?,
      boreholeName: freezed == boreholeName
          ? _self.boreholeName
          : boreholeName // ignore: cast_nullable_to_non_nullable
              as String?,
      routeName: freezed == routeName
          ? _self.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      studyMission: freezed == studyMission
          ? _self.studyMission
          : studyMission // ignore: cast_nullable_to_non_nullable
              as String?,
      constructedDepth: freezed == constructedDepth
          ? _self.constructedDepth
          : constructedDepth // ignore: cast_nullable_to_non_nullable
              as double?,
      completedStatus: freezed == completedStatus
          ? _self.completedStatus
          : completedStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      plannedDepth: freezed == plannedDepth
          ? _self.plannedDepth
          : plannedDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      seamName: freezed == seamName
          ? _self.seamName
          : seamName // ignore: cast_nullable_to_non_nullable
              as String?,
      notStartedStatus: freezed == notStartedStatus
          ? _self.notStartedStatus
          : notStartedStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      inProgressStatus: freezed == inProgressStatus
          ? _self.inProgressStatus
          : inProgressStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlannedBoreholeModel].
extension PlannedBoreholeModelPatterns on PlannedBoreholeModel {
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
    TResult Function(_PlannedBoreholeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel() when $default != null:
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
    TResult Function(_PlannedBoreholeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel():
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
    TResult? Function(_PlannedBoreholeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel() when $default != null:
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
            String? boreholeId,
            String? boreholeName,
            String? routeName,
            String? studyMission,
            double? constructedDepth,
            int? completedStatus,
            int? plannedDepth,
            String? seamName,
            int? notStartedStatus,
            int? inProgressStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel() when $default != null:
        return $default(
            _that.objectId,
            _that.boreholeId,
            _that.boreholeName,
            _that.routeName,
            _that.studyMission,
            _that.constructedDepth,
            _that.completedStatus,
            _that.plannedDepth,
            _that.seamName,
            _that.notStartedStatus,
            _that.inProgressStatus);
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
            String? boreholeId,
            String? boreholeName,
            String? routeName,
            String? studyMission,
            double? constructedDepth,
            int? completedStatus,
            int? plannedDepth,
            String? seamName,
            int? notStartedStatus,
            int? inProgressStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel():
        return $default(
            _that.objectId,
            _that.boreholeId,
            _that.boreholeName,
            _that.routeName,
            _that.studyMission,
            _that.constructedDepth,
            _that.completedStatus,
            _that.plannedDepth,
            _that.seamName,
            _that.notStartedStatus,
            _that.inProgressStatus);
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
            String? boreholeId,
            String? boreholeName,
            String? routeName,
            String? studyMission,
            double? constructedDepth,
            int? completedStatus,
            int? plannedDepth,
            String? seamName,
            int? notStartedStatus,
            int? inProgressStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlannedBoreholeModel() when $default != null:
        return $default(
            _that.objectId,
            _that.boreholeId,
            _that.boreholeName,
            _that.routeName,
            _that.studyMission,
            _that.constructedDepth,
            _that.completedStatus,
            _that.plannedDepth,
            _that.seamName,
            _that.notStartedStatus,
            _that.inProgressStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlannedBoreholeModel implements PlannedBoreholeModel {
  const _PlannedBoreholeModel(
      {this.objectId,
      this.boreholeId,
      this.boreholeName,
      this.routeName,
      this.studyMission,
      this.constructedDepth,
      this.completedStatus,
      this.plannedDepth,
      this.seamName,
      this.notStartedStatus,
      this.inProgressStatus});
  factory _PlannedBoreholeModel.fromJson(Map<String, dynamic> json) =>
      _$PlannedBoreholeModelFromJson(json);

  @override
  final int? objectId;
  @override
  final String? boreholeId;
  @override
  final String? boreholeName;
  @override
  final String? routeName;
  @override
  final String? studyMission;
  @override
  final double? constructedDepth;
  @override
  final int? completedStatus;
  @override
  final int? plannedDepth;
  @override
  final String? seamName;
  @override
  final int? notStartedStatus;
  @override
  final int? inProgressStatus;

  /// Create a copy of PlannedBoreholeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlannedBoreholeModelCopyWith<_PlannedBoreholeModel> get copyWith =>
      __$PlannedBoreholeModelCopyWithImpl<_PlannedBoreholeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlannedBoreholeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlannedBoreholeModel &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.boreholeId, boreholeId) ||
                other.boreholeId == boreholeId) &&
            (identical(other.boreholeName, boreholeName) ||
                other.boreholeName == boreholeName) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.studyMission, studyMission) ||
                other.studyMission == studyMission) &&
            (identical(other.constructedDepth, constructedDepth) ||
                other.constructedDepth == constructedDepth) &&
            (identical(other.completedStatus, completedStatus) ||
                other.completedStatus == completedStatus) &&
            (identical(other.plannedDepth, plannedDepth) ||
                other.plannedDepth == plannedDepth) &&
            (identical(other.seamName, seamName) ||
                other.seamName == seamName) &&
            (identical(other.notStartedStatus, notStartedStatus) ||
                other.notStartedStatus == notStartedStatus) &&
            (identical(other.inProgressStatus, inProgressStatus) ||
                other.inProgressStatus == inProgressStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      boreholeId,
      boreholeName,
      routeName,
      studyMission,
      constructedDepth,
      completedStatus,
      plannedDepth,
      seamName,
      notStartedStatus,
      inProgressStatus);

  @override
  String toString() {
    return 'PlannedBoreholeModel(objectId: $objectId, boreholeId: $boreholeId, boreholeName: $boreholeName, routeName: $routeName, studyMission: $studyMission, constructedDepth: $constructedDepth, completedStatus: $completedStatus, plannedDepth: $plannedDepth, seamName: $seamName, notStartedStatus: $notStartedStatus, inProgressStatus: $inProgressStatus)';
  }
}

/// @nodoc
abstract mixin class _$PlannedBoreholeModelCopyWith<$Res>
    implements $PlannedBoreholeModelCopyWith<$Res> {
  factory _$PlannedBoreholeModelCopyWith(_PlannedBoreholeModel value,
          $Res Function(_PlannedBoreholeModel) _then) =
      __$PlannedBoreholeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? objectId,
      String? boreholeId,
      String? boreholeName,
      String? routeName,
      String? studyMission,
      double? constructedDepth,
      int? completedStatus,
      int? plannedDepth,
      String? seamName,
      int? notStartedStatus,
      int? inProgressStatus});
}

/// @nodoc
class __$PlannedBoreholeModelCopyWithImpl<$Res>
    implements _$PlannedBoreholeModelCopyWith<$Res> {
  __$PlannedBoreholeModelCopyWithImpl(this._self, this._then);

  final _PlannedBoreholeModel _self;
  final $Res Function(_PlannedBoreholeModel) _then;

  /// Create a copy of PlannedBoreholeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? objectId = freezed,
    Object? boreholeId = freezed,
    Object? boreholeName = freezed,
    Object? routeName = freezed,
    Object? studyMission = freezed,
    Object? constructedDepth = freezed,
    Object? completedStatus = freezed,
    Object? plannedDepth = freezed,
    Object? seamName = freezed,
    Object? notStartedStatus = freezed,
    Object? inProgressStatus = freezed,
  }) {
    return _then(_PlannedBoreholeModel(
      objectId: freezed == objectId
          ? _self.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      boreholeId: freezed == boreholeId
          ? _self.boreholeId
          : boreholeId // ignore: cast_nullable_to_non_nullable
              as String?,
      boreholeName: freezed == boreholeName
          ? _self.boreholeName
          : boreholeName // ignore: cast_nullable_to_non_nullable
              as String?,
      routeName: freezed == routeName
          ? _self.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      studyMission: freezed == studyMission
          ? _self.studyMission
          : studyMission // ignore: cast_nullable_to_non_nullable
              as String?,
      constructedDepth: freezed == constructedDepth
          ? _self.constructedDepth
          : constructedDepth // ignore: cast_nullable_to_non_nullable
              as double?,
      completedStatus: freezed == completedStatus
          ? _self.completedStatus
          : completedStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      plannedDepth: freezed == plannedDepth
          ? _self.plannedDepth
          : plannedDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      seamName: freezed == seamName
          ? _self.seamName
          : seamName // ignore: cast_nullable_to_non_nullable
              as String?,
      notStartedStatus: freezed == notStartedStatus
          ? _self.notStartedStatus
          : notStartedStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      inProgressStatus: freezed == inProgressStatus
          ? _self.inProgressStatus
          : inProgressStatus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

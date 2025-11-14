// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MineModel {
  int? get id;
  String? get mineName;
  MineStatusEnum? get status;
  String? get mineralType;

  /// Create a copy of MineModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MineModelCopyWith<MineModel> get copyWith =>
      _$MineModelCopyWithImpl<MineModel>(this as MineModel, _$identity);

  /// Serializes this MineModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MineModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mineName, mineName) ||
                other.mineName == mineName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mineralType, mineralType) ||
                other.mineralType == mineralType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mineName, status, mineralType);

  @override
  String toString() {
    return 'MineModel(id: $id, mineName: $mineName, status: $status, mineralType: $mineralType)';
  }
}

/// @nodoc
abstract mixin class $MineModelCopyWith<$Res> {
  factory $MineModelCopyWith(MineModel value, $Res Function(MineModel) _then) =
      _$MineModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id, String? mineName, MineStatusEnum? status, String? mineralType});
}

/// @nodoc
class _$MineModelCopyWithImpl<$Res> implements $MineModelCopyWith<$Res> {
  _$MineModelCopyWithImpl(this._self, this._then);

  final MineModel _self;
  final $Res Function(MineModel) _then;

  /// Create a copy of MineModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mineName = freezed,
    Object? status = freezed,
    Object? mineralType = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mineName: freezed == mineName
          ? _self.mineName
          : mineName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MineStatusEnum?,
      mineralType: freezed == mineralType
          ? _self.mineralType
          : mineralType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MineModel].
extension MineModelPatterns on MineModel {
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
    TResult Function(_MineModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MineModel() when $default != null:
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
    TResult Function(_MineModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MineModel():
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
    TResult? Function(_MineModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MineModel() when $default != null:
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
    TResult Function(int? id, String? mineName, MineStatusEnum? status,
            String? mineralType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MineModel() when $default != null:
        return $default(
            _that.id, _that.mineName, _that.status, _that.mineralType);
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
    TResult Function(int? id, String? mineName, MineStatusEnum? status,
            String? mineralType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MineModel():
        return $default(
            _that.id, _that.mineName, _that.status, _that.mineralType);
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
    TResult? Function(int? id, String? mineName, MineStatusEnum? status,
            String? mineralType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MineModel() when $default != null:
        return $default(
            _that.id, _that.mineName, _that.status, _that.mineralType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MineModel implements MineModel {
  const _MineModel({this.id, this.mineName, this.status, this.mineralType});
  factory _MineModel.fromJson(Map<String, dynamic> json) =>
      _$MineModelFromJson(json);

  @override
  final int? id;
  @override
  final String? mineName;
  @override
  final MineStatusEnum? status;
  @override
  final String? mineralType;

  /// Create a copy of MineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MineModelCopyWith<_MineModel> get copyWith =>
      __$MineModelCopyWithImpl<_MineModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MineModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MineModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mineName, mineName) ||
                other.mineName == mineName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mineralType, mineralType) ||
                other.mineralType == mineralType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mineName, status, mineralType);

  @override
  String toString() {
    return 'MineModel(id: $id, mineName: $mineName, status: $status, mineralType: $mineralType)';
  }
}

/// @nodoc
abstract mixin class _$MineModelCopyWith<$Res>
    implements $MineModelCopyWith<$Res> {
  factory _$MineModelCopyWith(
          _MineModel value, $Res Function(_MineModel) _then) =
      __$MineModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id, String? mineName, MineStatusEnum? status, String? mineralType});
}

/// @nodoc
class __$MineModelCopyWithImpl<$Res> implements _$MineModelCopyWith<$Res> {
  __$MineModelCopyWithImpl(this._self, this._then);

  final _MineModel _self;
  final $Res Function(_MineModel) _then;

  /// Create a copy of MineModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? mineName = freezed,
    Object? status = freezed,
    Object? mineralType = freezed,
  }) {
    return _then(_MineModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      mineName: freezed == mineName
          ? _self.mineName
          : mineName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MineStatusEnum?,
      mineralType: freezed == mineralType
          ? _self.mineralType
          : mineralType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

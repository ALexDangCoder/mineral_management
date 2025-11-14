// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drill_hole_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrillHoleModel {
  int? get holeId;
  String? get holeName;
  String? get description;
  MineModel? get mine;

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrillHoleModelCopyWith<DrillHoleModel> get copyWith =>
      _$DrillHoleModelCopyWithImpl<DrillHoleModel>(
          this as DrillHoleModel, _$identity);

  /// Serializes this DrillHoleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DrillHoleModel &&
            (identical(other.holeId, holeId) || other.holeId == holeId) &&
            (identical(other.holeName, holeName) ||
                other.holeName == holeName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mine, mine) || other.mine == mine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, holeId, holeName, description, mine);

  @override
  String toString() {
    return 'DrillHoleModel(holeId: $holeId, holeName: $holeName, description: $description, mine: $mine)';
  }
}

/// @nodoc
abstract mixin class $DrillHoleModelCopyWith<$Res> {
  factory $DrillHoleModelCopyWith(
          DrillHoleModel value, $Res Function(DrillHoleModel) _then) =
      _$DrillHoleModelCopyWithImpl;
  @useResult
  $Res call(
      {int? holeId, String? holeName, String? description, MineModel? mine});

  $MineModelCopyWith<$Res>? get mine;
}

/// @nodoc
class _$DrillHoleModelCopyWithImpl<$Res>
    implements $DrillHoleModelCopyWith<$Res> {
  _$DrillHoleModelCopyWithImpl(this._self, this._then);

  final DrillHoleModel _self;
  final $Res Function(DrillHoleModel) _then;

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holeId = freezed,
    Object? holeName = freezed,
    Object? description = freezed,
    Object? mine = freezed,
  }) {
    return _then(_self.copyWith(
      holeId: freezed == holeId
          ? _self.holeId
          : holeId // ignore: cast_nullable_to_non_nullable
              as int?,
      holeName: freezed == holeName
          ? _self.holeName
          : holeName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mine: freezed == mine
          ? _self.mine
          : mine // ignore: cast_nullable_to_non_nullable
              as MineModel?,
    ));
  }

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MineModelCopyWith<$Res>? get mine {
    if (_self.mine == null) {
      return null;
    }

    return $MineModelCopyWith<$Res>(_self.mine!, (value) {
      return _then(_self.copyWith(mine: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DrillHoleModel].
extension DrillHoleModelPatterns on DrillHoleModel {
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
    TResult Function(_DrillHoleModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel() when $default != null:
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
    TResult Function(_DrillHoleModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel():
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
    TResult? Function(_DrillHoleModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel() when $default != null:
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
    TResult Function(int? holeId, String? holeName, String? description,
            MineModel? mine)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel() when $default != null:
        return $default(
            _that.holeId, _that.holeName, _that.description, _that.mine);
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
            int? holeId, String? holeName, String? description, MineModel? mine)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel():
        return $default(
            _that.holeId, _that.holeName, _that.description, _that.mine);
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
    TResult? Function(int? holeId, String? holeName, String? description,
            MineModel? mine)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillHoleModel() when $default != null:
        return $default(
            _that.holeId, _that.holeName, _that.description, _that.mine);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DrillHoleModel implements DrillHoleModel {
  const _DrillHoleModel(
      {this.holeId, this.holeName, this.description, this.mine});
  factory _DrillHoleModel.fromJson(Map<String, dynamic> json) =>
      _$DrillHoleModelFromJson(json);

  @override
  final int? holeId;
  @override
  final String? holeName;
  @override
  final String? description;
  @override
  final MineModel? mine;

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DrillHoleModelCopyWith<_DrillHoleModel> get copyWith =>
      __$DrillHoleModelCopyWithImpl<_DrillHoleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DrillHoleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrillHoleModel &&
            (identical(other.holeId, holeId) || other.holeId == holeId) &&
            (identical(other.holeName, holeName) ||
                other.holeName == holeName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mine, mine) || other.mine == mine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, holeId, holeName, description, mine);

  @override
  String toString() {
    return 'DrillHoleModel(holeId: $holeId, holeName: $holeName, description: $description, mine: $mine)';
  }
}

/// @nodoc
abstract mixin class _$DrillHoleModelCopyWith<$Res>
    implements $DrillHoleModelCopyWith<$Res> {
  factory _$DrillHoleModelCopyWith(
          _DrillHoleModel value, $Res Function(_DrillHoleModel) _then) =
      __$DrillHoleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? holeId, String? holeName, String? description, MineModel? mine});

  @override
  $MineModelCopyWith<$Res>? get mine;
}

/// @nodoc
class __$DrillHoleModelCopyWithImpl<$Res>
    implements _$DrillHoleModelCopyWith<$Res> {
  __$DrillHoleModelCopyWithImpl(this._self, this._then);

  final _DrillHoleModel _self;
  final $Res Function(_DrillHoleModel) _then;

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? holeId = freezed,
    Object? holeName = freezed,
    Object? description = freezed,
    Object? mine = freezed,
  }) {
    return _then(_DrillHoleModel(
      holeId: freezed == holeId
          ? _self.holeId
          : holeId // ignore: cast_nullable_to_non_nullable
              as int?,
      holeName: freezed == holeName
          ? _self.holeName
          : holeName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      mine: freezed == mine
          ? _self.mine
          : mine // ignore: cast_nullable_to_non_nullable
              as MineModel?,
    ));
  }

  /// Create a copy of DrillHoleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MineModelCopyWith<$Res>? get mine {
    if (_self.mine == null) {
      return null;
    }

    return $MineModelCopyWith<$Res>(_self.mine!, (value) {
      return _then(_self.copyWith(mine: value));
    });
  }
}

// dart format on

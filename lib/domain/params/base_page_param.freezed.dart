// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_page_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasePageParam<T> {
  int? get pageSize;
  int? get pageNow;
  T? get filter;

  /// Create a copy of BasePageParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BasePageParamCopyWith<T, BasePageParam<T>> get copyWith =>
      _$BasePageParamCopyWithImpl<T, BasePageParam<T>>(
          this as BasePageParam<T>, _$identity);

  /// Serializes this BasePageParam to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BasePageParam<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageNow, pageNow) || other.pageNow == pageNow) &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, pageNow,
      const DeepCollectionEquality().hash(filter));

  @override
  String toString() {
    return 'BasePageParam<$T>(pageSize: $pageSize, pageNow: $pageNow, filter: $filter)';
  }
}

/// @nodoc
abstract mixin class $BasePageParamCopyWith<T, $Res> {
  factory $BasePageParamCopyWith(
          BasePageParam<T> value, $Res Function(BasePageParam<T>) _then) =
      _$BasePageParamCopyWithImpl;
  @useResult
  $Res call({int? pageSize, int? pageNow, T? filter});
}

/// @nodoc
class _$BasePageParamCopyWithImpl<T, $Res>
    implements $BasePageParamCopyWith<T, $Res> {
  _$BasePageParamCopyWithImpl(this._self, this._then);

  final BasePageParam<T> _self;
  final $Res Function(BasePageParam<T>) _then;

  /// Create a copy of BasePageParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? pageNow = freezed,
    Object? filter = freezed,
  }) {
    return _then(_self.copyWith(
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNow: freezed == pageNow
          ? _self.pageNow
          : pageNow // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BasePageParam].
extension BasePageParamPatterns<T> on BasePageParam<T> {
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
    TResult Function(_BasePageParam<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BasePageParam() when $default != null:
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
    TResult Function(_BasePageParam<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BasePageParam():
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
    TResult? Function(_BasePageParam<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BasePageParam() when $default != null:
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
    TResult Function(int? pageSize, int? pageNow, T? filter)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BasePageParam() when $default != null:
        return $default(_that.pageSize, _that.pageNow, _that.filter);
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
    TResult Function(int? pageSize, int? pageNow, T? filter) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BasePageParam():
        return $default(_that.pageSize, _that.pageNow, _that.filter);
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
    TResult? Function(int? pageSize, int? pageNow, T? filter)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BasePageParam() when $default != null:
        return $default(_that.pageSize, _that.pageNow, _that.filter);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _BasePageParam<T> implements BasePageParam<T> {
  const _BasePageParam({this.pageSize, this.pageNow, this.filter});
  factory _BasePageParam.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BasePageParamFromJson(json, fromJsonT);

  @override
  final int? pageSize;
  @override
  final int? pageNow;
  @override
  final T? filter;

  /// Create a copy of BasePageParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BasePageParamCopyWith<T, _BasePageParam<T>> get copyWith =>
      __$BasePageParamCopyWithImpl<T, _BasePageParam<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$BasePageParamToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BasePageParam<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.pageNow, pageNow) || other.pageNow == pageNow) &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, pageNow,
      const DeepCollectionEquality().hash(filter));

  @override
  String toString() {
    return 'BasePageParam<$T>(pageSize: $pageSize, pageNow: $pageNow, filter: $filter)';
  }
}

/// @nodoc
abstract mixin class _$BasePageParamCopyWith<T, $Res>
    implements $BasePageParamCopyWith<T, $Res> {
  factory _$BasePageParamCopyWith(
          _BasePageParam<T> value, $Res Function(_BasePageParam<T>) _then) =
      __$BasePageParamCopyWithImpl;
  @override
  @useResult
  $Res call({int? pageSize, int? pageNow, T? filter});
}

/// @nodoc
class __$BasePageParamCopyWithImpl<T, $Res>
    implements _$BasePageParamCopyWith<T, $Res> {
  __$BasePageParamCopyWithImpl(this._self, this._then);

  final _BasePageParam<T> _self;
  final $Res Function(_BasePageParam<T>) _then;

  /// Create a copy of BasePageParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageSize = freezed,
    Object? pageNow = freezed,
    Object? filter = freezed,
  }) {
    return _then(_BasePageParam<T>(
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNow: freezed == pageNow
          ? _self.pageNow
          : pageNow // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultPage<T> {
  List<T>? get items;
  int? get pageNow;
  int? get pageTotal;
  int? get pageSize;
  int? get recordTotal;
  Map<String, dynamic>? get filter;

  /// Create a copy of ResultPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultPageCopyWith<T, ResultPage<T>> get copyWith =>
      _$ResultPageCopyWithImpl<T, ResultPage<T>>(
          this as ResultPage<T>, _$identity);

  /// Serializes this ResultPage to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultPage<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.pageNow, pageNow) || other.pageNow == pageNow) &&
            (identical(other.pageTotal, pageTotal) ||
                other.pageTotal == pageTotal) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.recordTotal, recordTotal) ||
                other.recordTotal == recordTotal) &&
            const DeepCollectionEquality().equals(other.filter, filter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      pageNow,
      pageTotal,
      pageSize,
      recordTotal,
      const DeepCollectionEquality().hash(filter));

  @override
  String toString() {
    return 'ResultPage<$T>(items: $items, pageNow: $pageNow, pageTotal: $pageTotal, pageSize: $pageSize, recordTotal: $recordTotal, filter: $filter)';
  }
}

/// @nodoc
abstract mixin class $ResultPageCopyWith<T, $Res> {
  factory $ResultPageCopyWith(
          ResultPage<T> value, $Res Function(ResultPage<T>) _then) =
      _$ResultPageCopyWithImpl;
  @useResult
  $Res call(
      {List<T>? items,
      int? pageNow,
      int? pageTotal,
      int? pageSize,
      int? recordTotal,
      Map<String, dynamic>? filter});
}

/// @nodoc
class _$ResultPageCopyWithImpl<T, $Res>
    implements $ResultPageCopyWith<T, $Res> {
  _$ResultPageCopyWithImpl(this._self, this._then);

  final ResultPage<T> _self;
  final $Res Function(ResultPage<T>) _then;

  /// Create a copy of ResultPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? pageNow = freezed,
    Object? pageTotal = freezed,
    Object? pageSize = freezed,
    Object? recordTotal = freezed,
    Object? filter = freezed,
  }) {
    return _then(_self.copyWith(
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      pageNow: freezed == pageNow
          ? _self.pageNow
          : pageNow // ignore: cast_nullable_to_non_nullable
              as int?,
      pageTotal: freezed == pageTotal
          ? _self.pageTotal
          : pageTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      recordTotal: freezed == recordTotal
          ? _self.recordTotal
          : recordTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResultPage].
extension ResultPagePatterns<T> on ResultPage<T> {
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
    TResult Function(_ResultPage<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResultPage() when $default != null:
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
    TResult Function(_ResultPage<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResultPage():
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
    TResult? Function(_ResultPage<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResultPage() when $default != null:
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
    TResult Function(List<T>? items, int? pageNow, int? pageTotal,
            int? pageSize, int? recordTotal, Map<String, dynamic>? filter)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResultPage() when $default != null:
        return $default(_that.items, _that.pageNow, _that.pageTotal,
            _that.pageSize, _that.recordTotal, _that.filter);
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
    TResult Function(List<T>? items, int? pageNow, int? pageTotal,
            int? pageSize, int? recordTotal, Map<String, dynamic>? filter)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResultPage():
        return $default(_that.items, _that.pageNow, _that.pageTotal,
            _that.pageSize, _that.recordTotal, _that.filter);
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
    TResult? Function(List<T>? items, int? pageNow, int? pageTotal,
            int? pageSize, int? recordTotal, Map<String, dynamic>? filter)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResultPage() when $default != null:
        return $default(_that.items, _that.pageNow, _that.pageTotal,
            _that.pageSize, _that.recordTotal, _that.filter);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _ResultPage<T> implements ResultPage<T> {
  const _ResultPage(
      {final List<T>? items,
      this.pageNow,
      this.pageTotal,
      this.pageSize,
      this.recordTotal,
      final Map<String, dynamic>? filter})
      : _items = items,
        _filter = filter;
  factory _ResultPage.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResultPageFromJson(json, fromJsonT);

  final List<T>? _items;
  @override
  List<T>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? pageNow;
  @override
  final int? pageTotal;
  @override
  final int? pageSize;
  @override
  final int? recordTotal;
  final Map<String, dynamic>? _filter;
  @override
  Map<String, dynamic>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableMapView) return _filter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of ResultPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultPageCopyWith<T, _ResultPage<T>> get copyWith =>
      __$ResultPageCopyWithImpl<T, _ResultPage<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ResultPageToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultPage<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pageNow, pageNow) || other.pageNow == pageNow) &&
            (identical(other.pageTotal, pageTotal) ||
                other.pageTotal == pageTotal) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.recordTotal, recordTotal) ||
                other.recordTotal == recordTotal) &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      pageNow,
      pageTotal,
      pageSize,
      recordTotal,
      const DeepCollectionEquality().hash(_filter));

  @override
  String toString() {
    return 'ResultPage<$T>(items: $items, pageNow: $pageNow, pageTotal: $pageTotal, pageSize: $pageSize, recordTotal: $recordTotal, filter: $filter)';
  }
}

/// @nodoc
abstract mixin class _$ResultPageCopyWith<T, $Res>
    implements $ResultPageCopyWith<T, $Res> {
  factory _$ResultPageCopyWith(
          _ResultPage<T> value, $Res Function(_ResultPage<T>) _then) =
      __$ResultPageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<T>? items,
      int? pageNow,
      int? pageTotal,
      int? pageSize,
      int? recordTotal,
      Map<String, dynamic>? filter});
}

/// @nodoc
class __$ResultPageCopyWithImpl<T, $Res>
    implements _$ResultPageCopyWith<T, $Res> {
  __$ResultPageCopyWithImpl(this._self, this._then);

  final _ResultPage<T> _self;
  final $Res Function(_ResultPage<T>) _then;

  /// Create a copy of ResultPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = freezed,
    Object? pageNow = freezed,
    Object? pageTotal = freezed,
    Object? pageSize = freezed,
    Object? recordTotal = freezed,
    Object? filter = freezed,
  }) {
    return _then(_ResultPage<T>(
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      pageNow: freezed == pageNow
          ? _self.pageNow
          : pageNow // ignore: cast_nullable_to_non_nullable
              as int?,
      pageTotal: freezed == pageTotal
          ? _self.pageTotal
          : pageTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      recordTotal: freezed == recordTotal
          ? _self.recordTotal
          : recordTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      filter: freezed == filter
          ? _self._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on

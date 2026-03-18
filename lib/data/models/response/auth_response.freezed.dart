// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponse {
  String? get accessToken;
  String? get refreshToken;
  int? get accessExpireIn;
  int? get refreshExpireIn;
  int? get isFirstLogin;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      _$AuthResponseCopyWithImpl<AuthResponse>(
          this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthResponse &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessExpireIn, accessExpireIn) ||
                other.accessExpireIn == accessExpireIn) &&
            (identical(other.refreshExpireIn, refreshExpireIn) ||
                other.refreshExpireIn == refreshExpireIn) &&
            (identical(other.isFirstLogin, isFirstLogin) ||
                other.isFirstLogin == isFirstLogin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      accessExpireIn, refreshExpireIn, isFirstLogin);

  @override
  String toString() {
    return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessExpireIn: $accessExpireIn, refreshExpireIn: $refreshExpireIn, isFirstLogin: $isFirstLogin)';
  }
}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) _then) =
      _$AuthResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? accessToken,
      String? refreshToken,
      int? accessExpireIn,
      int? refreshExpireIn,
      int? isFirstLogin});
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res> implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? accessExpireIn = freezed,
    Object? refreshExpireIn = freezed,
    Object? isFirstLogin = freezed,
  }) {
    return _then(_self.copyWith(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessExpireIn: freezed == accessExpireIn
          ? _self.accessExpireIn
          : accessExpireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshExpireIn: freezed == refreshExpireIn
          ? _self.refreshExpireIn
          : refreshExpireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isFirstLogin: freezed == isFirstLogin
          ? _self.isFirstLogin
          : isFirstLogin // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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
    TResult Function(_AuthResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthResponse() when $default != null:
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
    TResult Function(_AuthResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthResponse():
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
    TResult? Function(_AuthResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthResponse() when $default != null:
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
    TResult Function(String? accessToken, String? refreshToken,
            int? accessExpireIn, int? refreshExpireIn, int? isFirstLogin)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthResponse() when $default != null:
        return $default(_that.accessToken, _that.refreshToken,
            _that.accessExpireIn, _that.refreshExpireIn, _that.isFirstLogin);
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
    TResult Function(String? accessToken, String? refreshToken,
            int? accessExpireIn, int? refreshExpireIn, int? isFirstLogin)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthResponse():
        return $default(_that.accessToken, _that.refreshToken,
            _that.accessExpireIn, _that.refreshExpireIn, _that.isFirstLogin);
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
    TResult? Function(String? accessToken, String? refreshToken,
            int? accessExpireIn, int? refreshExpireIn, int? isFirstLogin)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthResponse() when $default != null:
        return $default(_that.accessToken, _that.refreshToken,
            _that.accessExpireIn, _that.refreshExpireIn, _that.isFirstLogin);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuthResponse implements AuthResponse {
  const _AuthResponse(
      {this.accessToken,
      this.refreshToken,
      this.accessExpireIn,
      this.refreshExpireIn,
      this.isFirstLogin});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final int? accessExpireIn;
  @override
  final int? refreshExpireIn;
  @override
  final int? isFirstLogin;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthResponse &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessExpireIn, accessExpireIn) ||
                other.accessExpireIn == accessExpireIn) &&
            (identical(other.refreshExpireIn, refreshExpireIn) ||
                other.refreshExpireIn == refreshExpireIn) &&
            (identical(other.isFirstLogin, isFirstLogin) ||
                other.isFirstLogin == isFirstLogin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      accessExpireIn, refreshExpireIn, isFirstLogin);

  @override
  String toString() {
    return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessExpireIn: $accessExpireIn, refreshExpireIn: $refreshExpireIn, isFirstLogin: $isFirstLogin)';
  }
}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(
          _AuthResponse value, $Res Function(_AuthResponse) _then) =
      __$AuthResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? accessToken,
      String? refreshToken,
      int? accessExpireIn,
      int? refreshExpireIn,
      int? isFirstLogin});
}

/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? accessExpireIn = freezed,
    Object? refreshExpireIn = freezed,
    Object? isFirstLogin = freezed,
  }) {
    return _then(_AuthResponse(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessExpireIn: freezed == accessExpireIn
          ? _self.accessExpireIn
          : accessExpireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshExpireIn: freezed == refreshExpireIn
          ? _self.refreshExpireIn
          : refreshExpireIn // ignore: cast_nullable_to_non_nullable
              as int?,
      isFirstLogin: freezed == isFirstLogin
          ? _self.isFirstLogin
          : isFirstLogin // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

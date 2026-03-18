// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendCodeRequest {
  String get email;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SendCodeRequestCopyWith<SendCodeRequest> get copyWith =>
      _$SendCodeRequestCopyWithImpl<SendCodeRequest>(
          this as SendCodeRequest, _$identity);

  /// Serializes this SendCodeRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendCodeRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SendCodeRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class $SendCodeRequestCopyWith<$Res> {
  factory $SendCodeRequestCopyWith(
          SendCodeRequest value, $Res Function(SendCodeRequest) _then) =
      _$SendCodeRequestCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$SendCodeRequestCopyWithImpl<$Res>
    implements $SendCodeRequestCopyWith<$Res> {
  _$SendCodeRequestCopyWithImpl(this._self, this._then);

  final SendCodeRequest _self;
  final $Res Function(SendCodeRequest) _then;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SendCodeRequest].
extension SendCodeRequestPatterns on SendCodeRequest {
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
    TResult Function(_SendCodeRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest() when $default != null:
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
    TResult Function(_SendCodeRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest():
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
    TResult? Function(_SendCodeRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest() when $default != null:
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
    TResult Function(String email)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest() when $default != null:
        return $default(_that.email);
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
    TResult Function(String email) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest():
        return $default(_that.email);
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
    TResult? Function(String email)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SendCodeRequest() when $default != null:
        return $default(_that.email);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SendCodeRequest implements SendCodeRequest {
  const _SendCodeRequest({required this.email});
  factory _SendCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendCodeRequestFromJson(json);

  @override
  final String email;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendCodeRequestCopyWith<_SendCodeRequest> get copyWith =>
      __$SendCodeRequestCopyWithImpl<_SendCodeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SendCodeRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendCodeRequest &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'SendCodeRequest(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$SendCodeRequestCopyWith<$Res>
    implements $SendCodeRequestCopyWith<$Res> {
  factory _$SendCodeRequestCopyWith(
          _SendCodeRequest value, $Res Function(_SendCodeRequest) _then) =
      __$SendCodeRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$SendCodeRequestCopyWithImpl<$Res>
    implements _$SendCodeRequestCopyWith<$Res> {
  __$SendCodeRequestCopyWithImpl(this._self, this._then);

  final _SendCodeRequest _self;
  final $Res Function(_SendCodeRequest) _then;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_SendCodeRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VerifyCodeRequest {
  String get email;
  String get code;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyCodeRequestCopyWith<VerifyCodeRequest> get copyWith =>
      _$VerifyCodeRequestCopyWithImpl<VerifyCodeRequest>(
          this as VerifyCodeRequest, _$identity);

  /// Serializes this VerifyCodeRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyCodeRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeRequest(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class $VerifyCodeRequestCopyWith<$Res> {
  factory $VerifyCodeRequestCopyWith(
          VerifyCodeRequest value, $Res Function(VerifyCodeRequest) _then) =
      _$VerifyCodeRequestCopyWithImpl;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$VerifyCodeRequestCopyWithImpl<$Res>
    implements $VerifyCodeRequestCopyWith<$Res> {
  _$VerifyCodeRequestCopyWithImpl(this._self, this._then);

  final VerifyCodeRequest _self;
  final $Res Function(VerifyCodeRequest) _then;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VerifyCodeRequest].
extension VerifyCodeRequestPatterns on VerifyCodeRequest {
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
    TResult Function(_VerifyCodeRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest() when $default != null:
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
    TResult Function(_VerifyCodeRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest():
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
    TResult? Function(_VerifyCodeRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest() when $default != null:
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
    TResult Function(String email, String code)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest() when $default != null:
        return $default(_that.email, _that.code);
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
    TResult Function(String email, String code) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest():
        return $default(_that.email, _that.code);
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
    TResult? Function(String email, String code)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VerifyCodeRequest() when $default != null:
        return $default(_that.email, _that.code);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VerifyCodeRequest implements VerifyCodeRequest {
  const _VerifyCodeRequest({required this.email, required this.code});
  factory _VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);

  @override
  final String email;
  @override
  final String code;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyCodeRequestCopyWith<_VerifyCodeRequest> get copyWith =>
      __$VerifyCodeRequestCopyWithImpl<_VerifyCodeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyCodeRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyCodeRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeRequest(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$VerifyCodeRequestCopyWith<$Res>
    implements $VerifyCodeRequestCopyWith<$Res> {
  factory _$VerifyCodeRequestCopyWith(
          _VerifyCodeRequest value, $Res Function(_VerifyCodeRequest) _then) =
      __$VerifyCodeRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$VerifyCodeRequestCopyWithImpl<$Res>
    implements _$VerifyCodeRequestCopyWith<$Res> {
  __$VerifyCodeRequestCopyWithImpl(this._self, this._then);

  final _VerifyCodeRequest _self;
  final $Res Function(_VerifyCodeRequest) _then;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_VerifyCodeRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

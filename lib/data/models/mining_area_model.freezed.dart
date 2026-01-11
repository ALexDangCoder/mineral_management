// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mining_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MiningAreaModel {
  int? get id;
  String? get name;
  String? get description;
  List<SubMiningAreaModel>? get subAreas;
  String? get icon;

  /// Create a copy of MiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MiningAreaModelCopyWith<MiningAreaModel> get copyWith =>
      _$MiningAreaModelCopyWithImpl<MiningAreaModel>(
          this as MiningAreaModel, _$identity);

  /// Serializes this MiningAreaModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MiningAreaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.subAreas, subAreas) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(subAreas), icon);

  @override
  String toString() {
    return 'MiningAreaModel(id: $id, name: $name, description: $description, subAreas: $subAreas, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $MiningAreaModelCopyWith<$Res> {
  factory $MiningAreaModelCopyWith(
          MiningAreaModel value, $Res Function(MiningAreaModel) _then) =
      _$MiningAreaModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      List<SubMiningAreaModel>? subAreas,
      String? icon});
}

/// @nodoc
class _$MiningAreaModelCopyWithImpl<$Res>
    implements $MiningAreaModelCopyWith<$Res> {
  _$MiningAreaModelCopyWithImpl(this._self, this._then);

  final MiningAreaModel _self;
  final $Res Function(MiningAreaModel) _then;

  /// Create a copy of MiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? subAreas = freezed,
    Object? icon = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subAreas: freezed == subAreas
          ? _self.subAreas
          : subAreas // ignore: cast_nullable_to_non_nullable
              as List<SubMiningAreaModel>?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MiningAreaModel].
extension MiningAreaModelPatterns on MiningAreaModel {
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
    TResult Function(_MiningAreaModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel() when $default != null:
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
    TResult Function(_MiningAreaModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel():
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
    TResult? Function(_MiningAreaModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel() when $default != null:
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
    TResult Function(int? id, String? name, String? description,
            List<SubMiningAreaModel>? subAreas, String? icon)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.subAreas,
            _that.icon);
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
    TResult Function(int? id, String? name, String? description,
            List<SubMiningAreaModel>? subAreas, String? icon)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel():
        return $default(_that.id, _that.name, _that.description, _that.subAreas,
            _that.icon);
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
    TResult? Function(int? id, String? name, String? description,
            List<SubMiningAreaModel>? subAreas, String? icon)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MiningAreaModel() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.subAreas,
            _that.icon);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MiningAreaModel implements MiningAreaModel {
  const _MiningAreaModel(
      {this.id,
      this.name,
      this.description,
      final List<SubMiningAreaModel>? subAreas,
      this.icon})
      : _subAreas = subAreas;
  factory _MiningAreaModel.fromJson(Map<String, dynamic> json) =>
      _$MiningAreaModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  final List<SubMiningAreaModel>? _subAreas;
  @override
  List<SubMiningAreaModel>? get subAreas {
    final value = _subAreas;
    if (value == null) return null;
    if (_subAreas is EqualUnmodifiableListView) return _subAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? icon;

  /// Create a copy of MiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MiningAreaModelCopyWith<_MiningAreaModel> get copyWith =>
      __$MiningAreaModelCopyWithImpl<_MiningAreaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MiningAreaModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MiningAreaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._subAreas, _subAreas) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_subAreas), icon);

  @override
  String toString() {
    return 'MiningAreaModel(id: $id, name: $name, description: $description, subAreas: $subAreas, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$MiningAreaModelCopyWith<$Res>
    implements $MiningAreaModelCopyWith<$Res> {
  factory _$MiningAreaModelCopyWith(
          _MiningAreaModel value, $Res Function(_MiningAreaModel) _then) =
      __$MiningAreaModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      List<SubMiningAreaModel>? subAreas,
      String? icon});
}

/// @nodoc
class __$MiningAreaModelCopyWithImpl<$Res>
    implements _$MiningAreaModelCopyWith<$Res> {
  __$MiningAreaModelCopyWithImpl(this._self, this._then);

  final _MiningAreaModel _self;
  final $Res Function(_MiningAreaModel) _then;

  /// Create a copy of MiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? subAreas = freezed,
    Object? icon = freezed,
  }) {
    return _then(_MiningAreaModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subAreas: freezed == subAreas
          ? _self._subAreas
          : subAreas // ignore: cast_nullable_to_non_nullable
              as List<SubMiningAreaModel>?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SubMiningAreaModel {
  int? get id;
  String? get name;
  String? get description;
  int? get miningAreaId;
  List<ProjectModel>? get projects;

  /// Create a copy of SubMiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubMiningAreaModelCopyWith<SubMiningAreaModel> get copyWith =>
      _$SubMiningAreaModelCopyWithImpl<SubMiningAreaModel>(
          this as SubMiningAreaModel, _$identity);

  /// Serializes this SubMiningAreaModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubMiningAreaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.miningAreaId, miningAreaId) ||
                other.miningAreaId == miningAreaId) &&
            const DeepCollectionEquality().equals(other.projects, projects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      miningAreaId, const DeepCollectionEquality().hash(projects));

  @override
  String toString() {
    return 'SubMiningAreaModel(id: $id, name: $name, description: $description, miningAreaId: $miningAreaId, projects: $projects)';
  }
}

/// @nodoc
abstract mixin class $SubMiningAreaModelCopyWith<$Res> {
  factory $SubMiningAreaModelCopyWith(
          SubMiningAreaModel value, $Res Function(SubMiningAreaModel) _then) =
      _$SubMiningAreaModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? miningAreaId,
      List<ProjectModel>? projects});
}

/// @nodoc
class _$SubMiningAreaModelCopyWithImpl<$Res>
    implements $SubMiningAreaModelCopyWith<$Res> {
  _$SubMiningAreaModelCopyWithImpl(this._self, this._then);

  final SubMiningAreaModel _self;
  final $Res Function(SubMiningAreaModel) _then;

  /// Create a copy of SubMiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? miningAreaId = freezed,
    Object? projects = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      miningAreaId: freezed == miningAreaId
          ? _self.miningAreaId
          : miningAreaId // ignore: cast_nullable_to_non_nullable
              as int?,
      projects: freezed == projects
          ? _self.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubMiningAreaModel].
extension SubMiningAreaModelPatterns on SubMiningAreaModel {
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
    TResult Function(_SubMiningAreaModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel() when $default != null:
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
    TResult Function(_SubMiningAreaModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel():
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
    TResult? Function(_SubMiningAreaModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel() when $default != null:
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
    TResult Function(int? id, String? name, String? description,
            int? miningAreaId, List<ProjectModel>? projects)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.miningAreaId, _that.projects);
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
    TResult Function(int? id, String? name, String? description,
            int? miningAreaId, List<ProjectModel>? projects)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel():
        return $default(_that.id, _that.name, _that.description,
            _that.miningAreaId, _that.projects);
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
    TResult? Function(int? id, String? name, String? description,
            int? miningAreaId, List<ProjectModel>? projects)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubMiningAreaModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.miningAreaId, _that.projects);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubMiningAreaModel implements SubMiningAreaModel {
  const _SubMiningAreaModel(
      {this.id,
      this.name,
      this.description,
      this.miningAreaId,
      final List<ProjectModel>? projects})
      : _projects = projects;
  factory _SubMiningAreaModel.fromJson(Map<String, dynamic> json) =>
      _$SubMiningAreaModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? miningAreaId;
  final List<ProjectModel>? _projects;
  @override
  List<ProjectModel>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SubMiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubMiningAreaModelCopyWith<_SubMiningAreaModel> get copyWith =>
      __$SubMiningAreaModelCopyWithImpl<_SubMiningAreaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubMiningAreaModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubMiningAreaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.miningAreaId, miningAreaId) ||
                other.miningAreaId == miningAreaId) &&
            const DeepCollectionEquality().equals(other._projects, _projects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      miningAreaId, const DeepCollectionEquality().hash(_projects));

  @override
  String toString() {
    return 'SubMiningAreaModel(id: $id, name: $name, description: $description, miningAreaId: $miningAreaId, projects: $projects)';
  }
}

/// @nodoc
abstract mixin class _$SubMiningAreaModelCopyWith<$Res>
    implements $SubMiningAreaModelCopyWith<$Res> {
  factory _$SubMiningAreaModelCopyWith(
          _SubMiningAreaModel value, $Res Function(_SubMiningAreaModel) _then) =
      __$SubMiningAreaModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? miningAreaId,
      List<ProjectModel>? projects});
}

/// @nodoc
class __$SubMiningAreaModelCopyWithImpl<$Res>
    implements _$SubMiningAreaModelCopyWith<$Res> {
  __$SubMiningAreaModelCopyWithImpl(this._self, this._then);

  final _SubMiningAreaModel _self;
  final $Res Function(_SubMiningAreaModel) _then;

  /// Create a copy of SubMiningAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? miningAreaId = freezed,
    Object? projects = freezed,
  }) {
    return _then(_SubMiningAreaModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      miningAreaId: freezed == miningAreaId
          ? _self.miningAreaId
          : miningAreaId // ignore: cast_nullable_to_non_nullable
              as int?,
      projects: freezed == projects
          ? _self._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
    ));
  }
}

/// @nodoc
mixin _$ProjectModel {
  int? get id;
  String? get name;
  String? get description;
  int? get subMiningAreaId;
  List<ProjectItemModel>? get items;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      _$ProjectModelCopyWithImpl<ProjectModel>(
          this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subMiningAreaId, subMiningAreaId) ||
                other.subMiningAreaId == subMiningAreaId) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      subMiningAreaId, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, description: $description, subMiningAreaId: $subMiningAreaId, items: $items)';
  }
}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) _then) =
      _$ProjectModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? subMiningAreaId,
      List<ProjectItemModel>? items});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res> implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? subMiningAreaId = freezed,
    Object? items = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subMiningAreaId: freezed == subMiningAreaId
          ? _self.subMiningAreaId
          : subMiningAreaId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectItemModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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
    TResult Function(_ProjectModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectModel() when $default != null:
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
    TResult Function(_ProjectModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectModel():
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
    TResult? Function(_ProjectModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectModel() when $default != null:
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
    TResult Function(int? id, String? name, String? description,
            int? subMiningAreaId, List<ProjectItemModel>? items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.subMiningAreaId, _that.items);
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
    TResult Function(int? id, String? name, String? description,
            int? subMiningAreaId, List<ProjectItemModel>? items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectModel():
        return $default(_that.id, _that.name, _that.description,
            _that.subMiningAreaId, _that.items);
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
    TResult? Function(int? id, String? name, String? description,
            int? subMiningAreaId, List<ProjectItemModel>? items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectModel() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.subMiningAreaId, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectModel implements ProjectModel {
  const _ProjectModel(
      {this.id,
      this.name,
      this.description,
      this.subMiningAreaId,
      final List<ProjectItemModel>? items})
      : _items = items;
  factory _ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? subMiningAreaId;
  final List<ProjectItemModel>? _items;
  @override
  List<ProjectItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectModelCopyWith<_ProjectModel> get copyWith =>
      __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subMiningAreaId, subMiningAreaId) ||
                other.subMiningAreaId == subMiningAreaId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      subMiningAreaId, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, description: $description, subMiningAreaId: $subMiningAreaId, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(
          _ProjectModel value, $Res Function(_ProjectModel) _then) =
      __$ProjectModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? subMiningAreaId,
      List<ProjectItemModel>? items});
}

/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? subMiningAreaId = freezed,
    Object? items = freezed,
  }) {
    return _then(_ProjectModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subMiningAreaId: freezed == subMiningAreaId
          ? _self.subMiningAreaId
          : subMiningAreaId // ignore: cast_nullable_to_non_nullable
              as int?,
      items: freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectItemModel>?,
    ));
  }
}

/// @nodoc
mixin _$ProjectItemModel {
  int? get id;
  String? get name;
  String? get type;
  int? get projectId;

  /// Create a copy of ProjectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectItemModelCopyWith<ProjectItemModel> get copyWith =>
      _$ProjectItemModelCopyWithImpl<ProjectItemModel>(
          this as ProjectItemModel, _$identity);

  /// Serializes this ProjectItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, projectId);

  @override
  String toString() {
    return 'ProjectItemModel(id: $id, name: $name, type: $type, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class $ProjectItemModelCopyWith<$Res> {
  factory $ProjectItemModelCopyWith(
          ProjectItemModel value, $Res Function(ProjectItemModel) _then) =
      _$ProjectItemModelCopyWithImpl;
  @useResult
  $Res call({int? id, String? name, String? type, int? projectId});
}

/// @nodoc
class _$ProjectItemModelCopyWithImpl<$Res>
    implements $ProjectItemModelCopyWith<$Res> {
  _$ProjectItemModelCopyWithImpl(this._self, this._then);

  final ProjectItemModel _self;
  final $Res Function(ProjectItemModel) _then;

  /// Create a copy of ProjectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProjectItemModel].
extension ProjectItemModelPatterns on ProjectItemModel {
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
    TResult Function(_ProjectItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel() when $default != null:
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
    TResult Function(_ProjectItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel():
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
    TResult? Function(_ProjectItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel() when $default != null:
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
    TResult Function(int? id, String? name, String? type, int? projectId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.projectId);
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
    TResult Function(int? id, String? name, String? type, int? projectId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel():
        return $default(_that.id, _that.name, _that.type, _that.projectId);
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
    TResult? Function(int? id, String? name, String? type, int? projectId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProjectItemModel() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.projectId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectItemModel implements ProjectItemModel {
  const _ProjectItemModel({this.id, this.name, this.type, this.projectId});
  factory _ProjectItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectItemModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final int? projectId;

  /// Create a copy of ProjectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectItemModelCopyWith<_ProjectItemModel> get copyWith =>
      __$ProjectItemModelCopyWithImpl<_ProjectItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, projectId);

  @override
  String toString() {
    return 'ProjectItemModel(id: $id, name: $name, type: $type, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class _$ProjectItemModelCopyWith<$Res>
    implements $ProjectItemModelCopyWith<$Res> {
  factory _$ProjectItemModelCopyWith(
          _ProjectItemModel value, $Res Function(_ProjectItemModel) _then) =
      __$ProjectItemModelCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? name, String? type, int? projectId});
}

/// @nodoc
class __$ProjectItemModelCopyWithImpl<$Res>
    implements _$ProjectItemModelCopyWith<$Res> {
  __$ProjectItemModelCopyWithImpl(this._self, this._then);

  final _ProjectItemModel _self;
  final $Res Function(_ProjectItemModel) _then;

  /// Create a copy of ProjectItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_ProjectItemModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

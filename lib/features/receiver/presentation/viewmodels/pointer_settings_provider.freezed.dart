// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pointer_settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointerSettings {
  Color get color;
  double get size;
  int get trailDurationMs;

  /// Create a copy of PointerSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PointerSettingsCopyWith<PointerSettings> get copyWith =>
      _$PointerSettingsCopyWithImpl<PointerSettings>(
          this as PointerSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PointerSettings &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.trailDurationMs, trailDurationMs) ||
                other.trailDurationMs == trailDurationMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, size, trailDurationMs);

  @override
  String toString() {
    return 'PointerSettings(color: $color, size: $size, trailDurationMs: $trailDurationMs)';
  }
}

/// @nodoc
abstract mixin class $PointerSettingsCopyWith<$Res> {
  factory $PointerSettingsCopyWith(
          PointerSettings value, $Res Function(PointerSettings) _then) =
      _$PointerSettingsCopyWithImpl;
  @useResult
  $Res call({Color color, double size, int trailDurationMs});
}

/// @nodoc
class _$PointerSettingsCopyWithImpl<$Res>
    implements $PointerSettingsCopyWith<$Res> {
  _$PointerSettingsCopyWithImpl(this._self, this._then);

  final PointerSettings _self;
  final $Res Function(PointerSettings) _then;

  /// Create a copy of PointerSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? size = null,
    Object? trailDurationMs = null,
  }) {
    return _then(_self.copyWith(
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      trailDurationMs: null == trailDurationMs
          ? _self.trailDurationMs
          : trailDurationMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PointerSettings].
extension PointerSettingsPatterns on PointerSettings {
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
    TResult Function(_PointerSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PointerSettings() when $default != null:
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
    TResult Function(_PointerSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PointerSettings():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(_PointerSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PointerSettings() when $default != null:
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
    TResult Function(Color color, double size, int trailDurationMs)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PointerSettings() when $default != null:
        return $default(_that.color, _that.size, _that.trailDurationMs);
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
    TResult Function(Color color, double size, int trailDurationMs) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PointerSettings():
        return $default(_that.color, _that.size, _that.trailDurationMs);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(Color color, double size, int trailDurationMs)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PointerSettings() when $default != null:
        return $default(_that.color, _that.size, _that.trailDurationMs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PointerSettings implements PointerSettings {
  const _PointerSettings(
      {required this.color,
      this.size = ReceiverScreenConstants.pointerSize,
      this.trailDurationMs = ReceiverScreenConstants.trailDurationMs});

  @override
  final Color color;
  @override
  @JsonKey()
  final double size;
  @override
  @JsonKey()
  final int trailDurationMs;

  /// Create a copy of PointerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PointerSettingsCopyWith<_PointerSettings> get copyWith =>
      __$PointerSettingsCopyWithImpl<_PointerSettings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PointerSettings &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.trailDurationMs, trailDurationMs) ||
                other.trailDurationMs == trailDurationMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, color, size, trailDurationMs);

  @override
  String toString() {
    return 'PointerSettings(color: $color, size: $size, trailDurationMs: $trailDurationMs)';
  }
}

/// @nodoc
abstract mixin class _$PointerSettingsCopyWith<$Res>
    implements $PointerSettingsCopyWith<$Res> {
  factory _$PointerSettingsCopyWith(
          _PointerSettings value, $Res Function(_PointerSettings) _then) =
      __$PointerSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({Color color, double size, int trailDurationMs});
}

/// @nodoc
class __$PointerSettingsCopyWithImpl<$Res>
    implements _$PointerSettingsCopyWith<$Res> {
  __$PointerSettingsCopyWithImpl(this._self, this._then);

  final _PointerSettings _self;
  final $Res Function(_PointerSettings) _then;

  /// Create a copy of PointerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? color = null,
    Object? size = null,
    Object? trailDurationMs = null,
  }) {
    return _then(_PointerSettings(
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      trailDurationMs: null == trailDurationMs
          ? _self.trailDurationMs
          : trailDurationMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

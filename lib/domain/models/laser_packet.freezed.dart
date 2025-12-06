// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'laser_packet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaserPacket {
  double get x; // X축 변화량 (Delta) 또는 좌표
  double get y; // Y축 변화량 (Delta) 또는 좌표
  bool get c;

  /// Create a copy of LaserPacket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaserPacketCopyWith<LaserPacket> get copyWith =>
      _$LaserPacketCopyWithImpl<LaserPacket>(this as LaserPacket, _$identity);

  /// Serializes this LaserPacket to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaserPacket &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.c, c) || other.c == c));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, c);

  @override
  String toString() {
    return 'LaserPacket(x: $x, y: $y, c: $c)';
  }
}

/// @nodoc
abstract mixin class $LaserPacketCopyWith<$Res> {
  factory $LaserPacketCopyWith(
          LaserPacket value, $Res Function(LaserPacket) _then) =
      _$LaserPacketCopyWithImpl;
  @useResult
  $Res call({double x, double y, bool c});
}

/// @nodoc
class _$LaserPacketCopyWithImpl<$Res> implements $LaserPacketCopyWith<$Res> {
  _$LaserPacketCopyWithImpl(this._self, this._then);

  final LaserPacket _self;
  final $Res Function(LaserPacket) _then;

  /// Create a copy of LaserPacket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? c = null,
  }) {
    return _then(_self.copyWith(
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      c: null == c
          ? _self.c
          : c // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [LaserPacket].
extension LaserPacketPatterns on LaserPacket {
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
    TResult Function(_LaserPacket value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LaserPacket() when $default != null:
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
    TResult Function(_LaserPacket value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserPacket():
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
    TResult? Function(_LaserPacket value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserPacket() when $default != null:
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
    TResult Function(double x, double y, bool c)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LaserPacket() when $default != null:
        return $default(_that.x, _that.y, _that.c);
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
    TResult Function(double x, double y, bool c) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserPacket():
        return $default(_that.x, _that.y, _that.c);
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
    TResult? Function(double x, double y, bool c)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserPacket() when $default != null:
        return $default(_that.x, _that.y, _that.c);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LaserPacket implements LaserPacket {
  const _LaserPacket({required this.x, required this.y, this.c = false});
  factory _LaserPacket.fromJson(Map<String, dynamic> json) =>
      _$LaserPacketFromJson(json);

  @override
  final double x;
// X축 변화량 (Delta) 또는 좌표
  @override
  final double y;
// Y축 변화량 (Delta) 또는 좌표
  @override
  @JsonKey()
  final bool c;

  /// Create a copy of LaserPacket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LaserPacketCopyWith<_LaserPacket> get copyWith =>
      __$LaserPacketCopyWithImpl<_LaserPacket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LaserPacketToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaserPacket &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.c, c) || other.c == c));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, c);

  @override
  String toString() {
    return 'LaserPacket(x: $x, y: $y, c: $c)';
  }
}

/// @nodoc
abstract mixin class _$LaserPacketCopyWith<$Res>
    implements $LaserPacketCopyWith<$Res> {
  factory _$LaserPacketCopyWith(
          _LaserPacket value, $Res Function(_LaserPacket) _then) =
      __$LaserPacketCopyWithImpl;
  @override
  @useResult
  $Res call({double x, double y, bool c});
}

/// @nodoc
class __$LaserPacketCopyWithImpl<$Res> implements _$LaserPacketCopyWith<$Res> {
  __$LaserPacketCopyWithImpl(this._self, this._then);

  final _LaserPacket _self;
  final $Res Function(_LaserPacket) _then;

  /// Create a copy of LaserPacket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? c = null,
  }) {
    return _then(_LaserPacket(
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      c: null == c
          ? _self.c
          : c // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

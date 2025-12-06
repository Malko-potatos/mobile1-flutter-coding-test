// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receiver_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaserTrail implements DiagnosticableTreeMixin {
  double get x;
  double get y;
  int get timestamp;

  /// Create a copy of LaserTrail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaserTrailCopyWith<LaserTrail> get copyWith =>
      _$LaserTrailCopyWithImpl<LaserTrail>(this as LaserTrail, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LaserTrail'))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaserTrail &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, timestamp);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LaserTrail(x: $x, y: $y, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $LaserTrailCopyWith<$Res> {
  factory $LaserTrailCopyWith(
          LaserTrail value, $Res Function(LaserTrail) _then) =
      _$LaserTrailCopyWithImpl;
  @useResult
  $Res call({double x, double y, int timestamp});
}

/// @nodoc
class _$LaserTrailCopyWithImpl<$Res> implements $LaserTrailCopyWith<$Res> {
  _$LaserTrailCopyWithImpl(this._self, this._then);

  final LaserTrail _self;
  final $Res Function(LaserTrail) _then;

  /// Create a copy of LaserTrail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? timestamp = null,
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
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [LaserTrail].
extension LaserTrailPatterns on LaserTrail {
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
    TResult Function(_LaserTrail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LaserTrail() when $default != null:
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
    TResult Function(_LaserTrail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserTrail():
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
    TResult? Function(_LaserTrail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserTrail() when $default != null:
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
    TResult Function(double x, double y, int timestamp)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LaserTrail() when $default != null:
        return $default(_that.x, _that.y, _that.timestamp);
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
    TResult Function(double x, double y, int timestamp) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserTrail():
        return $default(_that.x, _that.y, _that.timestamp);
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
    TResult? Function(double x, double y, int timestamp)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LaserTrail() when $default != null:
        return $default(_that.x, _that.y, _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LaserTrail with DiagnosticableTreeMixin implements LaserTrail {
  const _LaserTrail(
      {required this.x, required this.y, required this.timestamp});

  @override
  final double x;
  @override
  final double y;
  @override
  final int timestamp;

  /// Create a copy of LaserTrail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LaserTrailCopyWith<_LaserTrail> get copyWith =>
      __$LaserTrailCopyWithImpl<_LaserTrail>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'LaserTrail'))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaserTrail &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, timestamp);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LaserTrail(x: $x, y: $y, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$LaserTrailCopyWith<$Res>
    implements $LaserTrailCopyWith<$Res> {
  factory _$LaserTrailCopyWith(
          _LaserTrail value, $Res Function(_LaserTrail) _then) =
      __$LaserTrailCopyWithImpl;
  @override
  @useResult
  $Res call({double x, double y, int timestamp});
}

/// @nodoc
class __$LaserTrailCopyWithImpl<$Res> implements _$LaserTrailCopyWith<$Res> {
  __$LaserTrailCopyWithImpl(this._self, this._then);

  final _LaserTrail _self;
  final $Res Function(_LaserTrail) _then;

  /// Create a copy of LaserTrail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? timestamp = null,
  }) {
    return _then(_LaserTrail(
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ReceiverState implements DiagnosticableTreeMixin {
  bool get isConnected;
  LaserPacket? get packet;
  List<LaserTrail> get trails;

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiverStateCopyWith<ReceiverState> get copyWith =>
      _$ReceiverStateCopyWithImpl<ReceiverState>(
          this as ReceiverState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReceiverState'))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('packet', packet))
      ..add(DiagnosticsProperty('trails', trails));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiverState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.packet, packet) || other.packet == packet) &&
            const DeepCollectionEquality().equals(other.trails, trails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected, packet,
      const DeepCollectionEquality().hash(trails));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiverState(isConnected: $isConnected, packet: $packet, trails: $trails)';
  }
}

/// @nodoc
abstract mixin class $ReceiverStateCopyWith<$Res> {
  factory $ReceiverStateCopyWith(
          ReceiverState value, $Res Function(ReceiverState) _then) =
      _$ReceiverStateCopyWithImpl;
  @useResult
  $Res call({bool isConnected, LaserPacket? packet, List<LaserTrail> trails});

  $LaserPacketCopyWith<$Res>? get packet;
}

/// @nodoc
class _$ReceiverStateCopyWithImpl<$Res>
    implements $ReceiverStateCopyWith<$Res> {
  _$ReceiverStateCopyWithImpl(this._self, this._then);

  final ReceiverState _self;
  final $Res Function(ReceiverState) _then;

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? packet = freezed,
    Object? trails = null,
  }) {
    return _then(_self.copyWith(
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      packet: freezed == packet
          ? _self.packet
          : packet // ignore: cast_nullable_to_non_nullable
              as LaserPacket?,
      trails: null == trails
          ? _self.trails
          : trails // ignore: cast_nullable_to_non_nullable
              as List<LaserTrail>,
    ));
  }

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaserPacketCopyWith<$Res>? get packet {
    if (_self.packet == null) {
      return null;
    }

    return $LaserPacketCopyWith<$Res>(_self.packet!, (value) {
      return _then(_self.copyWith(packet: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReceiverState].
extension ReceiverStatePatterns on ReceiverState {
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
    TResult Function(_ReceiverState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
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
    TResult Function(_ReceiverState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState():
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
    TResult? Function(_ReceiverState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
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
            bool isConnected, LaserPacket? packet, List<LaserTrail> trails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
        return $default(_that.isConnected, _that.packet, _that.trails);
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
            bool isConnected, LaserPacket? packet, List<LaserTrail> trails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState():
        return $default(_that.isConnected, _that.packet, _that.trails);
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
    TResult? Function(
            bool isConnected, LaserPacket? packet, List<LaserTrail> trails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
        return $default(_that.isConnected, _that.packet, _that.trails);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReceiverState with DiagnosticableTreeMixin implements ReceiverState {
  const _ReceiverState(
      {this.isConnected = false,
      this.packet,
      final List<LaserTrail> trails = const []})
      : _trails = trails;

  @override
  @JsonKey()
  final bool isConnected;
  @override
  final LaserPacket? packet;
  final List<LaserTrail> _trails;
  @override
  @JsonKey()
  List<LaserTrail> get trails {
    if (_trails is EqualUnmodifiableListView) return _trails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trails);
  }

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceiverStateCopyWith<_ReceiverState> get copyWith =>
      __$ReceiverStateCopyWithImpl<_ReceiverState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ReceiverState'))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('packet', packet))
      ..add(DiagnosticsProperty('trails', trails));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceiverState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.packet, packet) || other.packet == packet) &&
            const DeepCollectionEquality().equals(other._trails, _trails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected, packet,
      const DeepCollectionEquality().hash(_trails));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiverState(isConnected: $isConnected, packet: $packet, trails: $trails)';
  }
}

/// @nodoc
abstract mixin class _$ReceiverStateCopyWith<$Res>
    implements $ReceiverStateCopyWith<$Res> {
  factory _$ReceiverStateCopyWith(
          _ReceiverState value, $Res Function(_ReceiverState) _then) =
      __$ReceiverStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isConnected, LaserPacket? packet, List<LaserTrail> trails});

  @override
  $LaserPacketCopyWith<$Res>? get packet;
}

/// @nodoc
class __$ReceiverStateCopyWithImpl<$Res>
    implements _$ReceiverStateCopyWith<$Res> {
  __$ReceiverStateCopyWithImpl(this._self, this._then);

  final _ReceiverState _self;
  final $Res Function(_ReceiverState) _then;

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isConnected = null,
    Object? packet = freezed,
    Object? trails = null,
  }) {
    return _then(_ReceiverState(
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      packet: freezed == packet
          ? _self.packet
          : packet // ignore: cast_nullable_to_non_nullable
              as LaserPacket?,
      trails: null == trails
          ? _self._trails
          : trails // ignore: cast_nullable_to_non_nullable
              as List<LaserTrail>,
    ));
  }

  /// Create a copy of ReceiverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaserPacketCopyWith<$Res>? get packet {
    if (_self.packet == null) {
      return null;
    }

    return $LaserPacketCopyWith<$Res>(_self.packet!, (value) {
      return _then(_self.copyWith(packet: value));
    });
  }
}

// dart format on

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
mixin _$ReceiverState implements DiagnosticableTreeMixin {
  bool get isConnected;
  LaserPacket? get packet;

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
      ..add(DiagnosticsProperty('packet', packet));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiverState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.packet, packet) || other.packet == packet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected, packet);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiverState(isConnected: $isConnected, packet: $packet)';
  }
}

/// @nodoc
abstract mixin class $ReceiverStateCopyWith<$Res> {
  factory $ReceiverStateCopyWith(
          ReceiverState value, $Res Function(ReceiverState) _then) =
      _$ReceiverStateCopyWithImpl;
  @useResult
  $Res call({bool isConnected, LaserPacket? packet});

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
    TResult Function(bool isConnected, LaserPacket? packet)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
        return $default(_that.isConnected, _that.packet);
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
    TResult Function(bool isConnected, LaserPacket? packet) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState():
        return $default(_that.isConnected, _that.packet);
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
    TResult? Function(bool isConnected, LaserPacket? packet)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReceiverState() when $default != null:
        return $default(_that.isConnected, _that.packet);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReceiverState with DiagnosticableTreeMixin implements ReceiverState {
  const _ReceiverState({this.isConnected = false, this.packet});

  @override
  @JsonKey()
  final bool isConnected;
  @override
  final LaserPacket? packet;

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
      ..add(DiagnosticsProperty('packet', packet));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceiverState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.packet, packet) || other.packet == packet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected, packet);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReceiverState(isConnected: $isConnected, packet: $packet)';
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
  $Res call({bool isConnected, LaserPacket? packet});

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

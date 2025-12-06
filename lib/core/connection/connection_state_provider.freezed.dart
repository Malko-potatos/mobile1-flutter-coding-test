// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_state_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionState implements DiagnosticableTreeMixin {
  bool get senderConnected;
  bool get receiverConnected;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      _$ConnectionStateCopyWithImpl<ConnectionState>(
          this as ConnectionState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ConnectionState'))
      ..add(DiagnosticsProperty('senderConnected', senderConnected))
      ..add(DiagnosticsProperty('receiverConnected', receiverConnected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectionState &&
            (identical(other.senderConnected, senderConnected) ||
                other.senderConnected == senderConnected) &&
            (identical(other.receiverConnected, receiverConnected) ||
                other.receiverConnected == receiverConnected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, senderConnected, receiverConnected);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectionState(senderConnected: $senderConnected, receiverConnected: $receiverConnected)';
  }
}

/// @nodoc
abstract mixin class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) _then) =
      _$ConnectionStateCopyWithImpl;
  @useResult
  $Res call({bool senderConnected, bool receiverConnected});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._self, this._then);

  final ConnectionState _self;
  final $Res Function(ConnectionState) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderConnected = null,
    Object? receiverConnected = null,
  }) {
    return _then(_self.copyWith(
      senderConnected: null == senderConnected
          ? _self.senderConnected
          : senderConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverConnected: null == receiverConnected
          ? _self.receiverConnected
          : receiverConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ConnectionState].
extension ConnectionStatePatterns on ConnectionState {
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
    TResult Function(_ConnectionState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConnectionState() when $default != null:
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
    TResult Function(_ConnectionState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionState():
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
    TResult? Function(_ConnectionState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionState() when $default != null:
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
    TResult Function(bool senderConnected, bool receiverConnected)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ConnectionState() when $default != null:
        return $default(_that.senderConnected, _that.receiverConnected);
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
    TResult Function(bool senderConnected, bool receiverConnected) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionState():
        return $default(_that.senderConnected, _that.receiverConnected);
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
    TResult? Function(bool senderConnected, bool receiverConnected)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ConnectionState() when $default != null:
        return $default(_that.senderConnected, _that.receiverConnected);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ConnectionState with DiagnosticableTreeMixin implements ConnectionState {
  const _ConnectionState(
      {this.senderConnected = false, this.receiverConnected = false});

  @override
  @JsonKey()
  final bool senderConnected;
  @override
  @JsonKey()
  final bool receiverConnected;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectionStateCopyWith<_ConnectionState> get copyWith =>
      __$ConnectionStateCopyWithImpl<_ConnectionState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ConnectionState'))
      ..add(DiagnosticsProperty('senderConnected', senderConnected))
      ..add(DiagnosticsProperty('receiverConnected', receiverConnected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConnectionState &&
            (identical(other.senderConnected, senderConnected) ||
                other.senderConnected == senderConnected) &&
            (identical(other.receiverConnected, receiverConnected) ||
                other.receiverConnected == receiverConnected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, senderConnected, receiverConnected);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConnectionState(senderConnected: $senderConnected, receiverConnected: $receiverConnected)';
  }
}

/// @nodoc
abstract mixin class _$ConnectionStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$ConnectionStateCopyWith(
          _ConnectionState value, $Res Function(_ConnectionState) _then) =
      __$ConnectionStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool senderConnected, bool receiverConnected});
}

/// @nodoc
class __$ConnectionStateCopyWithImpl<$Res>
    implements _$ConnectionStateCopyWith<$Res> {
  __$ConnectionStateCopyWithImpl(this._self, this._then);

  final _ConnectionState _self;
  final $Res Function(_ConnectionState) _then;

  /// Create a copy of ConnectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? senderConnected = null,
    Object? receiverConnected = null,
  }) {
    return _then(_ConnectionState(
      senderConnected: null == senderConnected
          ? _self.senderConnected
          : senderConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      receiverConnected: null == receiverConnected
          ? _self.receiverConnected
          : receiverConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

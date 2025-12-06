// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 전역 연결 상태를 관리하는 프로바이더입니다.
///
/// UDP 소켓 연결 상태를 추적하고, 패킷 수신/전송 여부에 따라
/// 연결 상태를 업데이트합니다. 타임아웃 로직을 포함하여
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.

@ProviderFor(ConnectionStateNotifier)
const connectionStateProvider = ConnectionStateNotifierProvider._();

/// 전역 연결 상태를 관리하는 프로바이더입니다.
///
/// UDP 소켓 연결 상태를 추적하고, 패킷 수신/전송 여부에 따라
/// 연결 상태를 업데이트합니다. 타임아웃 로직을 포함하여
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
final class ConnectionStateNotifierProvider
    extends $NotifierProvider<ConnectionStateNotifier, ConnectionState> {
  /// 전역 연결 상태를 관리하는 프로바이더입니다.
  ///
  /// UDP 소켓 연결 상태를 추적하고, 패킷 수신/전송 여부에 따라
  /// 연결 상태를 업데이트합니다. 타임아웃 로직을 포함하여
  /// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
  const ConnectionStateNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'connectionStateProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$connectionStateNotifierHash();

  @$internal
  @override
  ConnectionStateNotifier create() => ConnectionStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectionState>(value),
    );
  }
}

String _$connectionStateNotifierHash() =>
    r'6e172513eef43dc0a2736f9042e7629551a6b4ba';

/// 전역 연결 상태를 관리하는 프로바이더입니다.
///
/// UDP 소켓 연결 상태를 추적하고, 패킷 수신/전송 여부에 따라
/// 연결 상태를 업데이트합니다. 타임아웃 로직을 포함하여
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.

abstract class _$ConnectionStateNotifier extends $Notifier<ConnectionState> {
  ConnectionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ConnectionState, ConnectionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ConnectionState, ConnectionState>,
        ConnectionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

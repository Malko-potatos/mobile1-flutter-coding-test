// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// UDP 패킷 수신 및 연결 상태를 관리하는 ViewModel입니다.
///
/// 앱 실행 즉시 UDP 소켓을 열고 대기하며, 패킷 수신 시 연결 상태를 업데이트합니다.
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.

@ProviderFor(ReceiverViewModel)
const receiverViewModelProvider = ReceiverViewModelProvider._();

/// UDP 패킷 수신 및 연결 상태를 관리하는 ViewModel입니다.
///
/// 앱 실행 즉시 UDP 소켓을 열고 대기하며, 패킷 수신 시 연결 상태를 업데이트합니다.
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
final class ReceiverViewModelProvider
    extends $NotifierProvider<ReceiverViewModel, ReceiverState> {
  /// UDP 패킷 수신 및 연결 상태를 관리하는 ViewModel입니다.
  ///
  /// 앱 실행 즉시 UDP 소켓을 열고 대기하며, 패킷 수신 시 연결 상태를 업데이트합니다.
  /// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
  const ReceiverViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'receiverViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$receiverViewModelHash();

  @$internal
  @override
  ReceiverViewModel create() => ReceiverViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiverState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiverState>(value),
    );
  }
}

String _$receiverViewModelHash() => r'b384bc3e9c6691561564fe5d69e44dabc2dbde77';

/// UDP 패킷 수신 및 연결 상태를 관리하는 ViewModel입니다.
///
/// 앱 실행 즉시 UDP 소켓을 열고 대기하며, 패킷 수신 시 연결 상태를 업데이트합니다.
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.

abstract class _$ReceiverViewModel extends $Notifier<ReceiverState> {
  ReceiverState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReceiverState, ReceiverState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ReceiverState, ReceiverState>,
        ReceiverState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 센서 데이터 및 UDP 통신을 처리하는 ViewModel입니다.
///
/// [gyroscopeEventStream]을 기반으로 UDP 전송을 제어합니다.
/// 상태 [bool]은 송신기가 현재 활성 상태(패킷 전송 중)인지 여부를 나타냅니다.

@ProviderFor(SenderViewModel)
const senderViewModelProvider = SenderViewModelProvider._();

/// 센서 데이터 및 UDP 통신을 처리하는 ViewModel입니다.
///
/// [gyroscopeEventStream]을 기반으로 UDP 전송을 제어합니다.
/// 상태 [bool]은 송신기가 현재 활성 상태(패킷 전송 중)인지 여부를 나타냅니다.
final class SenderViewModelProvider
    extends $NotifierProvider<SenderViewModel, bool> {
  /// 센서 데이터 및 UDP 통신을 처리하는 ViewModel입니다.
  ///
  /// [gyroscopeEventStream]을 기반으로 UDP 전송을 제어합니다.
  /// 상태 [bool]은 송신기가 현재 활성 상태(패킷 전송 중)인지 여부를 나타냅니다.
  const SenderViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'senderViewModelProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$senderViewModelHash();

  @$internal
  @override
  SenderViewModel create() => SenderViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$senderViewModelHash() => r'ab20656440e28aef032f97c0b64ec18833050e8e';

/// 센서 데이터 및 UDP 통신을 처리하는 ViewModel입니다.
///
/// [gyroscopeEventStream]을 기반으로 UDP 전송을 제어합니다.
/// 상태 [bool]은 송신기가 현재 활성 상태(패킷 전송 중)인지 여부를 나타냅니다.

abstract class _$SenderViewModel extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

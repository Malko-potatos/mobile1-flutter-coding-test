// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointer_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 포인터 설정을 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 설정이 유지됩니다.

@ProviderFor(PointerSettingsNotifier)
const pointerSettingsProvider = PointerSettingsNotifierProvider._();

/// 포인터 설정을 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 설정이 유지됩니다.
final class PointerSettingsNotifierProvider
    extends $NotifierProvider<PointerSettingsNotifier, PointerSettings> {
  /// 포인터 설정을 관리하는 프로바이더입니다.
  ///
  /// keepAlive를 사용하여 앱 실행 중 설정이 유지됩니다.
  const PointerSettingsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pointerSettingsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pointerSettingsNotifierHash();

  @$internal
  @override
  PointerSettingsNotifier create() => PointerSettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PointerSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PointerSettings>(value),
    );
  }
}

String _$pointerSettingsNotifierHash() =>
    r'519437d9aa93e9ef80a10e6d2122734c226dc6d1';

/// 포인터 설정을 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 설정이 유지됩니다.

abstract class _$PointerSettingsNotifier extends $Notifier<PointerSettings> {
  PointerSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PointerSettings, PointerSettings>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PointerSettings, PointerSettings>,
        PointerSettings,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

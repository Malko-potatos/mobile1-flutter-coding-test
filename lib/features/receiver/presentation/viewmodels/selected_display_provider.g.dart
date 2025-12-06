// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_display_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 선택된 디스플레이를 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 선택된 디스플레이가 유지됩니다.

@ProviderFor(SelectedDisplayNotifier)
const selectedDisplayProvider = SelectedDisplayNotifierProvider._();

/// 선택된 디스플레이를 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 선택된 디스플레이가 유지됩니다.
final class SelectedDisplayNotifierProvider
    extends $NotifierProvider<SelectedDisplayNotifier, Display?> {
  /// 선택된 디스플레이를 관리하는 프로바이더입니다.
  ///
  /// keepAlive를 사용하여 앱 실행 중 선택된 디스플레이가 유지됩니다.
  const SelectedDisplayNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedDisplayProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$selectedDisplayNotifierHash();

  @$internal
  @override
  SelectedDisplayNotifier create() => SelectedDisplayNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Display? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Display?>(value),
    );
  }
}

String _$selectedDisplayNotifierHash() =>
    r'945fd1529e651b3847740869852ce5fabb8e2105';

/// 선택된 디스플레이를 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 선택된 디스플레이가 유지됩니다.

abstract class _$SelectedDisplayNotifier extends $Notifier<Display?> {
  Display? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Display?, Display?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Display?, Display?>, Display?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

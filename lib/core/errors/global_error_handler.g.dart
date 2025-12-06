// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_error_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 전역 에러 핸들러를 제공합니다.

@ProviderFor(globalErrorHandler)
const globalErrorHandlerProvider = GlobalErrorHandlerProvider._();

/// 전역 에러 핸들러를 제공합니다.

final class GlobalErrorHandlerProvider extends $FunctionalProvider<
    GlobalErrorHandler,
    GlobalErrorHandler,
    GlobalErrorHandler> with $Provider<GlobalErrorHandler> {
  /// 전역 에러 핸들러를 제공합니다.
  const GlobalErrorHandlerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'globalErrorHandlerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$globalErrorHandlerHash();

  @$internal
  @override
  $ProviderElement<GlobalErrorHandler> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GlobalErrorHandler create(Ref ref) {
    return globalErrorHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalErrorHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalErrorHandler>(value),
    );
  }
}

String _$globalErrorHandlerHash() =>
    r'5bbc62e38db4bf27e2f8e1922fb792fc45c62e77';

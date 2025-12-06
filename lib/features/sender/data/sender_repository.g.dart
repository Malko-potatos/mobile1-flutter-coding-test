// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// UDP 전송 기능에 접근할 수 있도록 제공합니다.

@ProviderFor(senderRepository)
const senderRepositoryProvider = SenderRepositoryProvider._();

/// UDP 전송 기능에 접근할 수 있도록 제공합니다.

final class SenderRepositoryProvider extends $FunctionalProvider<
    SenderRepository,
    SenderRepository,
    SenderRepository> with $Provider<SenderRepository> {
  /// UDP 전송 기능에 접근할 수 있도록 제공합니다.
  const SenderRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'senderRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$senderRepositoryHash();

  @$internal
  @override
  $ProviderElement<SenderRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SenderRepository create(Ref ref) {
    return senderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SenderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SenderRepository>(value),
    );
  }
}

String _$senderRepositoryHash() => r'633b0c738998b4d7427ee459adcd19a88e8b416c';

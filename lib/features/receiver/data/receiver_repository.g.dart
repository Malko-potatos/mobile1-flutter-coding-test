// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 레이저 데이터 수신을 위한 UDP 소켓에 접근할 수 있도록 제공합니다.

@ProviderFor(receiverRepository)
const receiverRepositoryProvider = ReceiverRepositoryProvider._();

/// 레이저 데이터 수신을 위한 UDP 소켓에 접근할 수 있도록 제공합니다.

final class ReceiverRepositoryProvider extends $FunctionalProvider<
    ReceiverRepository,
    ReceiverRepository,
    ReceiverRepository> with $Provider<ReceiverRepository> {
  /// 레이저 데이터 수신을 위한 UDP 소켓에 접근할 수 있도록 제공합니다.
  const ReceiverRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'receiverRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$receiverRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReceiverRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReceiverRepository create(Ref ref) {
    return receiverRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReceiverRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReceiverRepository>(value),
    );
  }
}

String _$receiverRepositoryHash() =>
    r'b8b72c1244421ad775f7c6b26688fe23c274c19e';

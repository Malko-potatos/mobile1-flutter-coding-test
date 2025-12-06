import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/data/receiver_repository.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/viewmodels/sender_viewmodel.dart';

part 'connection_state_provider.freezed.dart';
part 'connection_state_provider.g.dart';

/// 전역 연결 상태를 나타내는 모델입니다.
@freezed
abstract class ConnectionState with _$ConnectionState {
  /// 연결 상태를 생성합니다.
  ///
  /// [senderConnected]: 송신기가 패킷 전송 중이면 true
  /// [receiverConnected]: 수신기가 패킷 수신 중이면 true
  const factory ConnectionState({
    @Default(false) bool senderConnected,
    @Default(false) bool receiverConnected,
  }) = _ConnectionState;
}

/// 전역 연결 상태를 관리하는 프로바이더입니다.
///
/// UDP 소켓 연결 상태를 추적하고, 패킷 수신/전송 여부에 따라
/// 연결 상태를 업데이트합니다. 타임아웃 로직을 포함하여
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
@riverpod
class ConnectionStateNotifier extends _$ConnectionStateNotifier {
  StreamSubscription<LaserPacket>? _receiverSubscription;
  Timer? _receiverDisconnectTimer;

  /// 연결 타임아웃 시간 (2초간 데이터 없으면 끊김 처리)
  static const Duration _timeoutDuration = Duration(seconds: 2);

  @override
  ConnectionState build() {
    // 수신기 연결 상태 구독
    _subscribeToReceiver();

    // 송신기 연결 상태 구독 (초기 상태 설정)
    final senderState = ref.watch(senderViewModelProvider);
    final initialState = ConnectionState(senderConnected: senderState);

    // 송신기 상태 변화 리스너 설정
    ref.listen<bool>(
      senderViewModelProvider,
      (previous, next) {
        if (!ref.mounted) return;
        debugPrint(
            '[ConnectionStateNotifier] Sender state changed: prev=$previous, next=$next');
        // SenderViewModel의 상태(true = 전송 중)를 연결 상태로 반영
        state = state.copyWith(senderConnected: next);
      },
    );

    ref.onDispose(() {
      _receiverSubscription?.cancel();
      _receiverDisconnectTimer?.cancel();
    });

    return initialState;
  }

  /// 수신기 연결 상태를 구독합니다.
  ///
  /// ReceiverRepository의 패킷 스트림을 구독하여
  /// 패킷 수신 시 연결 상태를 업데이트하고, 타임아웃을 재설정합니다.
  void _subscribeToReceiver() {
    final repository = ref.watch(receiverRepositoryProvider);
    _receiverSubscription?.cancel();

    debugPrint(
        '[ConnectionStateNotifier] Starting to listen for receiver packets');
    _receiverSubscription = repository.getPacketStream().listen(
      (packet) {
        if (!ref.mounted) return;
        debugPrint('[ConnectionStateNotifier] Receiver packet received');
        // 패킷 수신 시: 연결됨 상태로 업데이트
        state = state.copyWith(receiverConnected: true);

        // 타임아웃 타이머 재설정
        _resetReceiverDisconnectTimer();
      },
      onError: (error) {
        debugPrint('[ConnectionStateNotifier] Receiver stream error: $error');
      },
      onDone: () {
        debugPrint('[ConnectionStateNotifier] Receiver stream done');
      },
      cancelOnError: false,
    );
  }

  /// 수신기 연결 타임아웃 타이머를 재설정합니다.
  ///
  /// 패킷이 수신될 때마다 호출되어, 일정 시간 동안 패킷이 없으면
  /// 연결 끊김 상태로 전환합니다.
  void _resetReceiverDisconnectTimer() {
    _receiverDisconnectTimer?.cancel();
    _receiverDisconnectTimer = Timer(_timeoutDuration, () {
      if (!ref.mounted) return;
      debugPrint('[ConnectionStateNotifier] Receiver timeout, disconnecting');
      // 타임아웃 발생 시: 연결 끊김 처리
      state = state.copyWith(receiverConnected: false);
    });
  }
}

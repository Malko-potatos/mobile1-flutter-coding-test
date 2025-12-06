import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/data/receiver_repository.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/pointer_settings_provider.dart';

part 'receiver_viewmodel.freezed.dart';
part 'receiver_viewmodel.g.dart';

/// 잔상 데이터를 나타내는 모델입니다.
@freezed
abstract class LaserTrail with _$LaserTrail {
  /// 잔상을 생성합니다.
  ///
  /// [x], [y]: 잔상의 위치 좌표
  /// [timestamp]: 잔상이 생성된 시간 (밀리초)
  const factory LaserTrail({
    required double x,
    required double y,
    required int timestamp,
  }) = _LaserTrail;
}

/// 연결 상태와 패킷 데이터를 포함하는 상태 모델입니다.
@freezed
abstract class ReceiverState with _$ReceiverState {
  /// 연결 상태와 패킷 데이터를 포함하는 상태를 생성합니다.
  ///
  /// [isConnected]: 패킷 수신 중이면 true
  /// [packet]: 최신 수신된 패킷 데이터 (없으면 null)
  /// [trails]: 터치 중일 때 생성된 잔상 리스트
  const factory ReceiverState({
    @Default(false) bool isConnected,
    LaserPacket? packet,
    @Default([]) List<LaserTrail> trails,
  }) = _ReceiverState;
}

/// UDP 패킷 수신 및 연결 상태를 관리하는 ViewModel입니다.
///
/// 앱 실행 즉시 UDP 소켓을 열고 대기하며, 패킷 수신 시 연결 상태를 업데이트합니다.
/// 일정 시간 동안 패킷이 없으면 연결 끊김으로 처리합니다.
@riverpod
class ReceiverViewModel extends _$ReceiverViewModel {
  StreamSubscription<LaserPacket>? _subscription;
  Timer? _disconnectTimer;
  Timer? _trailCleanupTimer;

  /// 연결 타임아웃 시간 (2초간 데이터 없으면 끊김 처리)
  static const Duration _timeoutDuration = Duration(seconds: 2);

  /// 잔상 정리 주기 (밀리초)
  static const int _trailCleanupIntervalMs = 50;

  @override
  ReceiverState build() {
    final repository = ref.watch(receiverRepositoryProvider);
    _startListening(repository);

    ref.onDispose(() {
      _subscription?.cancel();
      _disconnectTimer?.cancel();
      _trailCleanupTimer?.cancel();
    });

    // 잔상 정리 타이머 시작
    _startTrailCleanupTimer();

    return const ReceiverState();
  }

  /// UDP 패킷 스트림 구독을 시작합니다.
  void _startListening(ReceiverRepository repository) {
    _subscription?.cancel();
    debugPrint('[ReceiverViewModel] Starting to listen for packets');
    _subscription = repository.getPacketStream().listen(
      (packet) {
        if (!ref.mounted) return;
        debugPrint('[ReceiverViewModel] Packet received, updating state');

        // 1. 패킷 수신 시: 연결됨 상태 + 데이터 업데이트
        // 2. 터치 중일 때만 잔상 추가
        final now = DateTime.now().millisecondsSinceEpoch;
        final trails = packet.c
            ? [
                ...state.trails,
                LaserTrail(
                  x: packet.x,
                  y: packet.y,
                  timestamp: now,
                ),
              ]
            : state.trails; // 터치를 떼면 더 이상 잔상 추가 안 함

        state = state.copyWith(
          isConnected: true,
          packet: packet,
          trails: trails,
        );

        // 3. 기존 타이머 취소 및 타임아웃 재설정 (Heartbeat)
        _resetDisconnectTimer();
      },
      onError: (error) {
        debugPrint('[ReceiverViewModel] Stream error: $error');
      },
      onDone: () {
        debugPrint('[ReceiverViewModel] Stream done');
      },
      cancelOnError: false,
    );
  }

  /// 잔상 정리 타이머를 시작합니다.
  ///
  /// 주기적으로 오래된 잔상을 제거합니다.
  /// 설정에서 잔상 지속 시간을 가져와서 사용합니다.
  void _startTrailCleanupTimer() {
    _trailCleanupTimer?.cancel();
    _trailCleanupTimer = Timer.periodic(
      const Duration(milliseconds: _trailCleanupIntervalMs),
      (timer) {
        if (!ref.mounted) {
          timer.cancel();
          return;
        }

        // 설정에서 잔상 지속 시간 가져오기
        final settings = ref.read(pointerSettingsProvider);
        final trailDurationMs = settings.trailDurationMs;

        final now = DateTime.now().millisecondsSinceEpoch;
        final activeTrails = state.trails
            .where((trail) => now - trail.timestamp < trailDurationMs)
            .toList();

        // 잔상이 변경된 경우에만 상태 업데이트
        if (activeTrails.length != state.trails.length) {
          state = state.copyWith(trails: activeTrails);
        }
      },
    );
  }

  /// 연결 타임아웃 타이머를 재설정합니다.
  ///
  /// 패킷이 수신될 때마다 호출되어, 일정 시간 동안 패킷이 없으면
  /// 연결 끊김 상태로 전환합니다.
  void _resetDisconnectTimer() {
    _disconnectTimer?.cancel();
    _disconnectTimer = Timer(_timeoutDuration, () {
      // 타임아웃 발생 시: 연결 끊김 처리 및 잔상 초기화
      state = state.copyWith(
        isConnected: false,
        packet: null,
        trails: [],
      );
    });
  }
}

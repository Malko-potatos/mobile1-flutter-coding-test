import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
import 'package:mobile1_flutter_coding_test/features/sender/data/sender_repository.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';
import 'package:sensors_plus/sensors_plus.dart';

part 'sender_viewmodel.g.dart';

/// 센서 데이터 및 UDP 통신을 처리하는 ViewModel입니다.
///
/// [gyroscopeEventStream]을 기반으로 UDP 전송을 제어합니다.
/// 상태 [bool]은 송신기가 현재 활성 상태(패킷 전송 중)인지 여부를 나타냅니다.
@Riverpod(keepAlive: true)
class SenderViewModel extends _$SenderViewModel {
  StreamSubscription<GyroscopeEvent>? _sensorSubscription;
  SenderRepository? _repository;

  String _targetIp = '';

  // 현재 포인터 위치 (정규화된 -1.0 ~ 1.0)
  // 중심(0, 0)에서 시작
  double _currentX = SenderViewModelConstants.initialPosition;
  double _currentY = SenderViewModelConstants.initialPosition;

  // 패킷 전송 쓰로틀링을 위한 변수
  DateTime _lastPacketTime = DateTime.fromMillisecondsSinceEpoch(0);
  static const Duration _throttleDuration = Duration(milliseconds: 16); // ~60Hz

  @override
  bool build() {
    _repository = ref.read(senderRepositoryProvider);
    _repository!.initSocket();
    ref.onDispose(() {
      // dispose 중에는 state를 변경할 수 없으므로 리소스만 정리
      _cleanup();
      _repository?.dispose();
    });
    return false; // 초기 상태: 전송 중 아님
  }

  /// 현재 대상 IP 주소를 반환합니다.
  String get targetIp => _targetIp;

  /// 수신기의 대상 IP 주소를 설정합니다.
  ///
  /// [ip]는 유효한 IPv4 주소 문자열이어야 합니다.
  void setTargetIp(String ip) {
    debugPrint('[SenderViewModel] Setting target IP: $ip');
    _targetIp = ip;
    debugPrint('[SenderViewModel] Target IP set to: $_targetIp');
  }

  /// 센서 이벤트 수신 및 UDP 패킷 전송을 시작합니다.
  ///
  /// [targetIp]가 비어있거나 이미 전송 중이면 아무 작업도 수행하지 않습니다.
  void startSending() {
    debugPrint('[SenderViewModel] startSending called');
    debugPrint('[SenderViewModel] Target IP: $_targetIp');
    debugPrint('[SenderViewModel] Current state: $state');
    debugPrint('[SenderViewModel] ref.mounted: ${ref.mounted}');

    if (_targetIp.isEmpty) {
      debugPrint('[SenderViewModel] Cannot start: Target IP is empty');
      return;
    }
    if (state) {
      debugPrint('[SenderViewModel] Already sending, skipping');
      return; // 이미 전송 중
    }
    if (!ref.mounted) {
      debugPrint('[SenderViewModel] Cannot start: Provider disposed');
      return; // provider가 dispose된 경우
    }

    debugPrint(
        '[SenderViewModel] Starting sensor stream and setting state to true');
    state = true;

    // 자이로스코프 이벤트 구독
    // gyroscopeEventStream은 rad/s 단위의 회전 속도를 반환합니다.
    // SensorInterval.gameInterval (약 20ms/50Hz) 사용으로 부드러운 움직임 확보
    _sensorSubscription =
        gyroscopeEventStream(samplingPeriod: SensorInterval.gameInterval)
            .listen(
      (GyroscopeEvent event) {
        // 구독 중에 provider가 dispose될 수 있으므로 확인
        if (!ref.mounted) {
          _sensorSubscription?.cancel();
          _sensorSubscription = null;
          return;
        }
        _updatePosition(event);

        // 쓰로틀링 적용: ~60Hz (16ms) 주기로 패킷 전송
        final now = DateTime.now();
        if (now.difference(_lastPacketTime) >= _throttleDuration) {
          _sendPositionPacket();
          _lastPacketTime = now;
        }
      },
      onError: (error) {
        debugPrint('[SenderViewModel] Sensor stream error: $error');
      },
      onDone: () {
        debugPrint('[SenderViewModel] Sensor stream done');
      },
      cancelOnError: false,
    );

    debugPrint('[SenderViewModel] Sensor subscription started');
  }

  /// 회전 이벤트를 기반으로 포인터 위치를 업데이트합니다.
  ///
  /// 세로 모드를 가정:
  /// - Z축 회전(Yaw)은 X 이동
  /// - X축 회전(Pitch)은 Y 이동
  /// 자연스러운 스크롤 선호도에 따라 음수 부호가 필요할 수 있습니다.
  void _updatePosition(GyroscopeEvent event) {
    // 노이즈 필터링 (Deadzone): 미세한 떨림 무시
    if (event.x.abs() < SenderViewModelConstants.deadzone &&
        event.z.abs() < SenderViewModelConstants.deadzone) {
      return;
    }

    _currentX += -event.z * SenderViewModelConstants.sensitivity;
    _currentY += -event.x * SenderViewModelConstants.sensitivity;

    // 정규화된 화면 경계(-1.0 ~ 1.0) 내에서 포인터를 유지하도록 값 제한
    _currentX = _currentX.clamp(
      SenderViewModelConstants.minPosition,
      SenderViewModelConstants.maxPosition,
    );
    _currentY = _currentY.clamp(
      SenderViewModelConstants.minPosition,
      SenderViewModelConstants.maxPosition,
    );
  }

  /// 현재 위치 패킷을 전송합니다.
  void _sendPositionPacket() {
    _repository?.sendPacket(
      LaserPacket(x: _currentX, y: _currentY, c: false),
      _targetIp,
    );
  }

  /// 센서 구독 및 패킷 전송을 중지합니다.
  void stopSending() {
    _cleanup();

    // provider가 아직 살아있는 경우에만 state 변경
    if (ref.mounted) {
      state = false;

      // 선택적으로 위치를 중심으로 재설정
      _currentX = SenderViewModelConstants.initialPosition;
      _currentY = SenderViewModelConstants.initialPosition;
    }
  }

  /// 리소스를 정리합니다 (state 변경 없이).
  ///
  /// dispose 중에 호출될 수 있으므로 state를 변경하지 않습니다.
  void _cleanup() {
    _sensorSubscription?.cancel();
    _sensorSubscription = null;
  }

  /// 클릭 이벤트 패킷을 전송합니다.
  ///
  /// [isClicking]은 버튼 누름 상태를 나타냅니다.
  /// 센서 스트림이 활성 상태여도 이 메서드는 작동하며,
  /// 클릭이 현재 좌표로 전송되도록 보장합니다.
  void sendClick(bool isClicking) {
    // 대상이 있어야 전송 (센서 스트리밍 중이 아니어도 전송 가능)
    if (_targetIp.isEmpty) return;

    _repository?.sendPacket(
      LaserPacket(x: _currentX, y: _currentY, c: isClicking),
      _targetIp,
    );
  }
}

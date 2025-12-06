import 'package:freezed_annotation/freezed_annotation.dart';

part 'laser_packet.freezed.dart';
part 'laser_packet.g.dart';

/// 레이저 포인터 UDP 전송용 패킷을 나타냅니다.
///
/// 모바일 송신기에서 데스크톱 수신기로 전송되는 이동 및 클릭 상태 정보를
/// 포함합니다. UDP 전송 효율을 위해 필드명을 최소화했습니다.
@freezed
abstract class LaserPacket with _$LaserPacket {
  /// 주어진 좌표와 클릭 상태로 [LaserPacket]을 생성합니다.
  ///
  /// [x]와 [y]는 이동 변화량 또는 절대 좌표를 나타냅니다.
  /// [c]는 현재 클릭 동작이 활성화되어 있는지 여부를 나타냅니다.
  const factory LaserPacket({
    /// X축 이동 변화량 또는 좌표입니다.
    required double x,

    /// Y축 이동 변화량 또는 좌표입니다.
    required double y,

    /// 클릭 동작이 현재 활성화되어 있는지 여부입니다.
    ///
    /// 지정되지 않은 경우 `false`로 기본값이 설정됩니다.
    @Default(false) bool c,
  }) = _LaserPacket;

  /// JSON 맵으로부터 [LaserPacket]을 생성합니다.
  ///
  /// JSON 표현을 파싱하여 새로운 [LaserPacket] 인스턴스를 반환합니다.
  /// JSON 맵은 `x` (숫자), `y` (숫자), 그리고 선택적으로 `c` (불린) 필드를
  /// 포함해야 합니다.
  factory LaserPacket.fromJson(Map<String, dynamic> json) =>
      _$LaserPacketFromJson(json);
}

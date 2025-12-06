/// Sender ViewModel의 상수 값들을 정의합니다.
class SenderViewModelConstants {
  SenderViewModelConstants._();

  // 센서 감도 상수
  static const double sensitivity = 0.15;

  // 포인터 위치 경계값 (정규화된 좌표 범위)
  static const double minPosition = -1.0;
  static const double maxPosition = 1.0;
  static const double initialPosition = 0.0;
}


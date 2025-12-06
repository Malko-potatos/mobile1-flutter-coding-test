import 'package:flutter/material.dart';

/// Receiver Screen의 상수 값들을 정의합니다.
class ReceiverScreenConstants {
  ReceiverScreenConstants._();

  // 레이저 포인터 스타일 상수
  static const double borderWidth = 4.0;
  static const double borderAlpha = 0.3;
  static const double pointerSize = 20.0;
  static const double pointerAlpha = 0.5;
  static const double shadowAlpha = 0.8;
  static const double shadowBlurRadius = 10.0;
  static const double shadowSpreadRadius = 2.0;

  // 잔상 관련 상수
  static const int trailDurationMs = 500; // 잔상 지속 시간 (밀리초)

  // 윈도우 스타일 상수
  static const Size restoreWindowSize = Size(800, 600);
  static const double windowOpacity = 1.0;
}

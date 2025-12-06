import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/constants/receiver_screen_constants.dart';

part 'pointer_settings_provider.freezed.dart';
part 'pointer_settings_provider.g.dart';

/// 포인터 스타일 설정을 나타내는 모델입니다.
@freezed
abstract class PointerSettings with _$PointerSettings {
  /// 포인터 설정을 생성합니다.
  ///
  /// [color]: 포인터 색상 (기본값: rsupportOrange)
  /// [size]: 포인터 크기 (기본값: 20.0)
  /// [trailDurationMs]: 잔상 지속 시간 (밀리초, 기본값: 500)
  const factory PointerSettings({
    required Color color,
    @Default(ReceiverScreenConstants.pointerSize) double size,
    @Default(ReceiverScreenConstants.trailDurationMs) int trailDurationMs,
  }) = _PointerSettings;

  /// 기본 설정을 생성합니다.
  factory PointerSettings.defaults() => PointerSettings(
        color: AppTheme.rsupportOrange,
        size: ReceiverScreenConstants.pointerSize,
        trailDurationMs: ReceiverScreenConstants.trailDurationMs,
      );
}

/// 포인터 설정을 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 설정이 유지됩니다.
@Riverpod(keepAlive: true)
class PointerSettingsNotifier extends _$PointerSettingsNotifier {
  @override
  PointerSettings build() {
    // 기본 설정 반환
    return PointerSettings.defaults();
  }

  /// 포인터 색상을 업데이트합니다.
  void updateColor(Color color) {
    state = state.copyWith(color: color);
  }

  /// 포인터 크기를 업데이트합니다.
  void updateSize(double size) {
    state = state.copyWith(size: size);
  }

  /// 잔상 지속 시간을 업데이트합니다.
  void updateTrailDuration(int durationMs) {
    state = state.copyWith(trailDurationMs: durationMs);
  }
}


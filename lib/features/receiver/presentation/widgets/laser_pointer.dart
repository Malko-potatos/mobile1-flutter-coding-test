import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/receiver_viewmodel.dart';

/// 레이저 포인터를 렌더링하는 위젯입니다.
///
/// [LaserPacket]의 좌표와 클릭 상태에 따라 포인터의 위치와 색상을 표시합니다.
/// 터치 중일 때 생성된 잔상도 함께 렌더링합니다.
class LaserPointer extends StatelessWidget {
  /// [LaserPointer]를 생성합니다.
  const LaserPointer({
    super.key,
    required this.packet,
    required this.trails,
    required this.size,
    required this.color,
    required this.inactiveAlpha,
    required this.shadowAlpha,
    required this.shadowBlurRadius,
    required this.shadowSpreadRadius,
    required this.trailDurationMs,
  });

  final LaserPacket packet;
  final List<LaserTrail> trails;
  final double size;
  final Color color;
  final double inactiveAlpha;
  final double shadowAlpha;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final int trailDurationMs;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().millisecondsSinceEpoch;

    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 잔상 렌더링
          ...trails.map((trail) {
            final age = now - trail.timestamp;
            final progress = age / trailDurationMs;
            // 시간에 따라 페이드 아웃 (1.0 -> 0.0)
            final alpha = math.max(0.0, 1.0 - progress);

            return Positioned.fill(
              child: Align(
                alignment: Alignment(trail.x, trail.y),
                  child: Opacity(
                  opacity: alpha * inactiveAlpha, // 잔상은 더 투명하게
                  child: Container(
                    width: size * 0.8, // 잔상은 약간 작게
                    height: size * 0.8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: shadowAlpha * alpha),
                          blurRadius: shadowBlurRadius * 0.7,
                          spreadRadius: shadowSpreadRadius * 0.7,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          // 현재 포인터 렌더링
          AnimatedAlign(
            duration: const Duration(milliseconds: 60),
            curve: Curves.linear,
            alignment: Alignment(packet.x, packet.y),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: packet.c
                    ? color
                    : color.withValues(alpha: inactiveAlpha),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: shadowAlpha),
                    blurRadius: shadowBlurRadius,
                    spreadRadius: shadowSpreadRadius,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


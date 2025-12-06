import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';

/// 레이저 포인터를 렌더링하는 위젯입니다.
///
/// [LaserPacket]의 좌표와 클릭 상태에 따라 포인터의 위치와 색상을 표시합니다.
class LaserPointer extends StatelessWidget {
  /// [LaserPointer]를 생성합니다.
  const LaserPointer({
    super.key,
    required this.packet,
    required this.size,
    required this.inactiveAlpha,
    required this.shadowAlpha,
    required this.shadowBlurRadius,
    required this.shadowSpreadRadius,
  });

  final LaserPacket packet;
  final double size;
  final double inactiveAlpha;
  final double shadowAlpha;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 60),
            curve: Curves.linear,
            alignment: Alignment(packet.x, packet.y),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: packet.c
                    ? AppTheme.rsupportOrange
                    : AppTheme.rsupportOrange.withValues(alpha: inactiveAlpha),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.rsupportOrange.withValues(alpha: shadowAlpha),
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


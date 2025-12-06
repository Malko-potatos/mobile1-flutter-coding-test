import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';

/// 오버레이 컨테이너 위젯입니다.
///
/// 연결 중일 때 빨간 테두리를 표시합니다.
class OverlayContainer extends StatelessWidget {
  /// [OverlayContainer]를 생성합니다.
  const OverlayContainer({
    super.key,
    required this.borderWidth,
    required this.borderAlpha,
    required this.child,
  });

  final double borderWidth;
  final double borderAlpha;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.rsupportOrange.withValues(alpha: borderAlpha),
            width: borderWidth,
          ),
        ),
        child: child,
      ),
    );
  }
}


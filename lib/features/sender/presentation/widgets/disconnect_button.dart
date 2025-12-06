import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';

/// 연결 종료 버튼 위젯입니다.
///
/// Rsupport Error Red 색상을 사용하는 경고 버튼입니다.
class DisconnectButton extends StatelessWidget {
  /// [DisconnectButton]을 생성합니다.
  const DisconnectButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SenderControlScreenConstants.buttonHeight,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.stop_circle_outlined),
        label: const Text(
          'DISCONNECT',
          style: TextStyle(
            fontSize: SenderControlScreenConstants.buttonFontSize,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.errorRed,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}


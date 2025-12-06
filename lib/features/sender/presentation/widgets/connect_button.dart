import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';

/// 연결 버튼 위젯입니다.
///
/// Rsupport Orange 색상을 사용하는 Primary 버튼입니다.
class ConnectButton extends StatelessWidget {
  /// [ConnectButton]을 생성합니다.
  const ConnectButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: SenderSetupScreenConstants.buttonVerticalPadding,
          ),
        ),
        child: const Text(
          'CONNECT & START',
          style: TextStyle(
            fontSize: SenderSetupScreenConstants.buttonFontSize,
          ),
        ),
      ),
    );
  }
}


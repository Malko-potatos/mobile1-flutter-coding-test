import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/viewmodels/sender_viewmodel.dart';

/// 터치패드 영역 위젯입니다.
///
/// 클릭 이벤트를 처리하고 현재 타겟 IP를 표시합니다.
class TouchpadArea extends StatelessWidget {
  /// [TouchpadArea]를 생성합니다.
  const TouchpadArea({
    super.key,
    required this.viewModel,
  });

  final SenderViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => viewModel.sendClick(true),
      onTapUp: (_) => viewModel.sendClick(false),
      onTapCancel: () => viewModel.sendClick(false),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            SenderControlScreenConstants.touchpadBorderRadius,
          ),
          border: Border.all(
            color: Colors.deepPurple,
            width: SenderControlScreenConstants.touchpadBorderWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.touch_app,
              size: SenderControlScreenConstants.touchpadIconSize,
              color: Colors.deepPurple,
            ),
            const SizedBox(
              height: SenderControlScreenConstants.touchpadTextSpacing,
            ),
            const Text(
              'Tilt phone to Move\nTap to Click',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SenderControlScreenConstants.touchpadFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: SenderControlScreenConstants.touchpadSubTextSpacing,
            ),
            Text(
              'Target: ${viewModel.targetIp}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}


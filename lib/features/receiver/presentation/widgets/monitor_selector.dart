import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/constants/constants.dart';

/// 모니터 선택 드롭다운 위젯입니다.
class MonitorSelector extends StatelessWidget {
  /// [MonitorSelector]를 생성합니다.
  const MonitorSelector({
    super.key,
    required this.displays,
    required this.selectedDisplay,
    required this.onDisplayChanged,
  });

  final List<Display> displays;
  final Display? selectedDisplay;
  final ValueChanged<Display?> onDisplayChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ReceiverSetupScreenConstants.monitorSelectorPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.desktop_windows,
                color: AppTheme.rsupportNavy,
              ),
              const SizedBox(width: 8),
              Text(
                'Select Monitor',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: ReceiverSetupScreenConstants.monitorSelectorSpacing),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DropdownButton<Display>(
                isExpanded: true,
                value: selectedDisplay,
                items: displays.asMap().entries.map((entry) {
                  final index = entry.key;
                  final display = entry.value;
                  return DropdownMenuItem(
                    value: display,
                    child: Text('Display${index + 1}'),
                  );
                }).toList(),
                onChanged: onDisplayChanged,
                underline: const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


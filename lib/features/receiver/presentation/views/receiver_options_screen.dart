import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/pointer_settings_provider.dart';

/// 포인터 스타일 옵션 화면입니다.
class ReceiverOptionsScreen extends ConsumerStatefulWidget {
  const ReceiverOptionsScreen({super.key});

  @override
  ConsumerState<ReceiverOptionsScreen> createState() =>
      _ReceiverOptionsScreenState();
}

class _ReceiverOptionsScreenState extends ConsumerState<ReceiverOptionsScreen> {
  /// 색상 선택 다이얼로그를 표시합니다.
  void _showColorPickerDialog(
      Color currentColor, Function(Color) onColorChanged) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: currentColor,
              onColorChanged: (color) {
                onColorChanged(color);
                Navigator.of(context).pop();
              },
              availableColors: const [
                Colors.red,
                Colors.pink,
                Colors.purple,
                Colors.deepPurple,
                Colors.indigo,
                Colors.blue,
                Colors.lightBlue,
                Colors.cyan,
                Colors.teal,
                Colors.green,
                Colors.lightGreen,
                Colors.lime,
                Colors.yellow,
                Colors.amber,
                Colors.orange,
                AppTheme.rsupportOrange,
                Colors.deepOrange,
                Colors.brown,
                Colors.grey,
                Colors.blueGrey,
                Colors.black,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(pointerSettingsProvider);
    final settingsNotifier = ref.read(pointerSettingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pointer Options'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 포인터 색상 선택
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pointer Color',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      _showColorPickerDialog(
                        settings.color,
                        (color) {
                          settingsNotifier.updateColor(color);
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: settings.color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: settings.color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Color',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '#${settings.color.value.toRadixString(16).substring(2).toUpperCase()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey.shade600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 포인터 크기 (두께)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pointer Size',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${settings.size.toInt()}px',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: settings.size,
                    min: 10.0,
                    max: 50.0,
                    divisions: 40,
                    label: '${settings.size.toInt()}px',
                    onChanged: (value) {
                      settingsNotifier.updateSize(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 잔상 지속 시간
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trail Duration',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${settings.trailDurationMs}ms',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: settings.trailDurationMs.toDouble(),
                    min: 100.0,
                    max: 2000.0,
                    divisions: 19,
                    label: '${settings.trailDurationMs}ms',
                    onChanged: (value) {
                      settingsNotifier.updateTrailDuration(value.toInt());
                    },
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

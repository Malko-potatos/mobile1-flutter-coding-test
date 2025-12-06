import 'package:flutter/material.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';

/// IP 주소를 표시하는 위젯입니다.
class IpDisplay extends StatelessWidget {
  /// [IpDisplay]를 생성합니다.
  const IpDisplay({
    super.key,
    required this.ipAddress,
  });

  final String ipAddress;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi,
              color: AppTheme.rsupportOrange,
            ),
            const SizedBox(width: 8),
            Text(
              'My IP: $ipAddress',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

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
    return Text(
      'My IP: $ipAddress',
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey),
    );
  }
}


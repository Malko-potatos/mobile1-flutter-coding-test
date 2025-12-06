import 'package:flutter/material.dart';

/// IP 주소 입력 필드 위젯입니다.
///
/// QR 코드 스캐너 기능을 포함합니다.
class IpInputField extends StatelessWidget {
  /// [IpInputField]를 생성합니다.
  const IpInputField({
    super.key,
    required this.controller,
    required this.onQrScanPressed,
  });

  final TextEditingController controller;
  final VoidCallback onQrScanPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Receiver IP Address',
        hintText: '192.168.x.x',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.qr_code_scanner),
          onPressed: onQrScanPressed,
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/constants/constants.dart';

/// QR 코드 및 IP 정보를 표시하는 섹션 위젯입니다.
class QrCodeSection extends StatelessWidget {
  /// [QrCodeSection]을 생성합니다.
  const QrCodeSection({
    super.key,
    required this.ipAddress,
  });

  final String? ipAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (ipAddress != null)
          QrImageView(
            data: ipAddress!,
            version: QrVersions.auto,
            size: ReceiverSetupScreenConstants.qrCodeSize,
          ),
        const SizedBox(height: ReceiverSetupScreenConstants.qrCodeSpacing),
        Text(
          'IP: ${ipAddress ?? 'Unknown IP'}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: ReceiverSetupScreenConstants.statusSpacing),
        const CircularProgressIndicator(),
        const SizedBox(height: ReceiverSetupScreenConstants.statusTextSpacing),
        const Text(
          'Listening for Mobile App...',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

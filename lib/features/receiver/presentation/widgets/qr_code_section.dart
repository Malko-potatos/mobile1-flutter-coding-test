import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
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
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ipAddress != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: QrImageView(
                  data: ipAddress!,
                  version: QrVersions.auto,
                  size: ReceiverSetupScreenConstants.qrCodeSize,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          const SizedBox(height: ReceiverSetupScreenConstants.qrCodeSpacing),
          Text(
            'IP: ${ipAddress ?? 'Unknown IP'}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}

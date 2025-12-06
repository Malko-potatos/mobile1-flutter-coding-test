import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';

/// QR 코드 스캐너 모달 위젯입니다.
class QrScannerModal extends StatelessWidget {
  /// [QrScannerModal]을 생성합니다.
  const QrScannerModal({
    super.key,
    required this.onBarcodeDetected,
  });

  final ValueChanged<String> onBarcodeDetected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SenderSetupScreenConstants.qrScannerHeight,
      child: MobileScanner(
        onDetect: (capture) {
          final barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final rawValue = barcode.rawValue;
            if (rawValue != null) {
              onBarcodeDetected(rawValue);
              // GoRouter와의 충돌을 피하기 위해, 최상위 페이지를
              // 강제로 pop하지 않고 가능할 때만 모달을 닫습니다.
              Navigator.of(context).maybePop();
              break;
            }
          }
        },
      ),
    );
  }
}


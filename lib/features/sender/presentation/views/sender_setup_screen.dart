import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/viewmodels/sender_viewmodel.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/widgets/widgets.dart';
import 'package:network_info_plus/network_info_plus.dart';

class SenderSetupScreen extends ConsumerStatefulWidget {
  const SenderSetupScreen({super.key});

  @override
  ConsumerState<SenderSetupScreen> createState() => _SenderSetupScreenState();
}

class _SenderSetupScreenState extends ConsumerState<SenderSetupScreen> {
  final TextEditingController _ipController = TextEditingController();
  String? _myIp;

  @override
  void initState() {
    super.initState();
    _loadMyIp();
  }

  Future<void> _loadMyIp() async {
    final info = NetworkInfo();
    final ip = await info.getWifiIP();
    setState(() => _myIp = ip);
  }

  void _onConnect() {
    final ip = _ipController.text.trim();
    if (ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter Receiver IP')),
      );
      return;
    }

    debugPrint('[SenderSetupScreen] Connecting to IP: $ip');
    
    // IP 저장 및 제어 화면으로 이동
    ref.read(senderViewModelProvider.notifier).setTargetIp(ip);
    
    // IP가 제대로 설정되었는지 확인
    final viewModel = ref.read(senderViewModelProvider.notifier);
    debugPrint('[SenderSetupScreen] Target IP set to: ${viewModel.targetIp}');
    
    context.go('/sender/control');
  }

  void _openQRScanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => QrScannerModal(
        onBarcodeDetected: (value) {
          setState(() {
            _ipController.text = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect to PC')),
      body: Padding(
        padding: const EdgeInsets.all(SenderSetupScreenConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_myIp != null) ...[
              IpDisplay(ipAddress: _myIp!),
              const SizedBox(
                height: SenderSetupScreenConstants.ipDisplaySpacing,
              ),
            ],
            IpInputField(
              controller: _ipController,
              onQrScanPressed: _openQRScanner,
            ),
            const SizedBox(
              height: SenderSetupScreenConstants.inputFieldSpacing,
            ),
            ConnectButton(onPressed: _onConnect),
          ],
        ),
      ),
    );
  }
}

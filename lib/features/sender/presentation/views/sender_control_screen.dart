import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/constants/constants.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/viewmodels/sender_viewmodel.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/widgets/widgets.dart';

class SenderControlScreen extends ConsumerStatefulWidget {
  const SenderControlScreen({super.key});

  @override
  ConsumerState<SenderControlScreen> createState() =>
      _SenderControlScreenState();
}

class _SenderControlScreenState extends ConsumerState<SenderControlScreen> {
  // dispose에서 안전하게 사용하기 위해 notifier를 필드에 저장
  SenderViewModel? _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 화면 진입 시 전송 시작 (didChangeDependencies에서 ref 사용 가능)
    if (_viewModel == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _viewModel = ref.read(senderViewModelProvider.notifier);
          debugPrint(
              '[SenderControlScreen] Starting sending to IP: ${_viewModel?.targetIp}');
          _viewModel?.startSending();
        }
      });
    }
  }

  @override
  void dispose() {
    // 화면 이탈 시 리소스만 정리 (dispose 중에는 state 변경 불가)
    // ref.onDispose에서 자동으로 정리되므로 여기서는 추가 작업 불필요
    super.dispose();
  }

  void _onStop() {
    // 먼저 전송 중지 (provider가 dispose되기 전에)
    _viewModel?.stopSending();

    // 다음 프레임에서 navigation 수행 (현재 프레임이 완전히 끝난 후)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.pop(); // 설정 화면으로 복귀
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // build에서 notifier를 가져와서 필드에 저장
    _viewModel ??= ref.read(senderViewModelProvider.notifier);
    final viewModel = _viewModel!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laser Controller'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _onStop, // 뒤로가기 누르면 연결 종료
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SenderControlScreenConstants.padding),
        child: Column(
          children: [
            Expanded(
              child: TouchpadArea(viewModel: viewModel),
            ),
            const SizedBox(height: SenderControlScreenConstants.spacing),
            DisconnectButton(onPressed: _onStop),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SenderControlScreenConstants.padding,
          vertical: SenderControlScreenConstants.textSpacing,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.targetIp.isEmpty
                    ? 'Not connected'
                    : 'Connected to ${viewModel.targetIp}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

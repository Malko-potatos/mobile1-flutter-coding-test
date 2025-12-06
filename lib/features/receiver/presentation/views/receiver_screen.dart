import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/constants/constants.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/receiver_viewmodel.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/widgets/widgets.dart';
import 'package:window_manager/window_manager.dart';

/// 투명한 윈도우에 레이저 포인터를 표시합니다.
///
/// [receiverViewModelProvider]를 구독하여 수신된 [LaserPacket] 데이터를
/// 기반으로 화면에 레이저 포인터를 렌더링합니다. 패킷의 좌표와 클릭 상태에
/// 따라 포인터의 위치와 색상을 업데이트합니다.
/// 연결이 끊기면 자동으로 설정 화면으로 복귀합니다.
class ReceiverScreen extends ConsumerStatefulWidget {
  /// [ReceiverScreen]을 생성합니다.
  const ReceiverScreen({super.key});

  @override
  ConsumerState<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends ConsumerState<ReceiverScreen> {
  @override
  void initState() {
    super.initState();
    // initState에서 비동기 작업을 직접 호출하면 안 되므로
    // WidgetsBinding을 사용하여 프레임 후 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setWindowStyle();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 오버레이 화면에서는 항상 오버레이 스타일 유지
    // didChangeDependencies가 호출될 때마다 스타일 재적용 (원복 방지)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setWindowStyle();
    });
  }

  /// 오버레이 윈도우 스타일을 설정합니다.
  Future<void> _setWindowStyle() async {
    // 오버레이 화면에서는 항상 오버레이 스타일 적용
    // (다른 화면에서 원복 시도를 방지하기 위해 매번 재적용)
    
    // 선택된 디스플레이 정보 가져오기 (또는 기본 디스플레이 사용)
    try {
      final displays = await screenRetriever.getAllDisplays();
      if (displays.isNotEmpty) {
        // 첫 번째 디스플레이를 사용 (또는 선택된 디스플레이가 있다면 그것을 사용)
        final display = displays[0];
        final position = display.visiblePosition ?? Offset.zero;
        
        // 윈도우를 해당 모니터 영역으로 이동 및 크기 조절 (전체화면)
        await windowManager.setBounds(Rect.fromLTWH(
          position.dx,
          position.dy,
          display.size.width,
          display.size.height,
        ));
      }
    } catch (e) {
      // 디스플레이 정보를 가져올 수 없는 경우 무시
      debugPrint('Failed to get display info: $e');
    }
    
    await windowManager.setAlwaysOnTop(true);
    await windowManager.setHasShadow(false);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    await windowManager.setIgnoreMouseEvents(true);
    await windowManager.setOpacity(ReceiverScreenConstants.windowOpacity);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(receiverViewModelProvider);

    // 연결되었지만 패킷이 아직 없으면 빈 화면 (초기 연결 시)
    final packet = state.packet;
    if (packet == null) {
      // 연결 상태는 있지만 패킷이 없는 경우 (초기 연결 시)
      if (state.isConnected) {
        // 연결은 되었지만 아직 패킷이 수신되지 않음 - 빈 화면 유지
        return const SizedBox.shrink();
      }
      // 연결도 안 된 경우
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: OverlayContainer(
          borderWidth: ReceiverScreenConstants.borderWidth,
          borderAlpha: ReceiverScreenConstants.borderAlpha,
          child: LaserPointer(
            packet: packet,
            trails: state.trails,
            size: ReceiverScreenConstants.pointerSize,
            inactiveAlpha: ReceiverScreenConstants.pointerAlpha,
            shadowAlpha: ReceiverScreenConstants.shadowAlpha,
            shadowBlurRadius: ReceiverScreenConstants.shadowBlurRadius,
            shadowSpreadRadius: ReceiverScreenConstants.shadowSpreadRadius,
            trailDurationMs: ReceiverScreenConstants.trailDurationMs,
          ),
        ),
      ),
    );
  }
}

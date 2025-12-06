import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
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
  bool _isDisconnecting = false;

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

  /// 윈도우 설정을 창 모드로 원복합니다.
  Future<void> _restoreWindowStyle() async {
    // 창 모드로 원복
    await windowManager.setSize(ReceiverScreenConstants.restoreWindowSize);
    await windowManager.setAlignment(Alignment.center);
    await windowManager.setOpacity(ReceiverScreenConstants.windowOpacity);
    await windowManager.setIgnoreMouseEvents(false);
    await windowManager.setBackgroundColor(Colors.white);
    await windowManager.setAlwaysOnTop(false);
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setHasShadow(true);
  }

  /// 연결 끊김을 처리합니다.
  ///
  /// 윈도우 설정을 원복한 후 다음 이벤트 루프에 설정 화면으로 이동합니다.
  void _handleDisconnection() {
    if (!mounted) {
      _isDisconnecting = false;
      return;
    }
    
    // Navigator가 locked 상태일 수 있으므로 충분한 지연 후 navigation 수행
    _restoreWindowStyle().then((_) {
      if (!mounted) {
        _isDisconnecting = false;
        return;
      }
      
      // 여러 프레임과 긴 지연을 두어 Navigator가 완전히 unlock될 때까지 대기
      // 첫 번째 프레임 대기
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          _isDisconnecting = false;
          return;
        }
        
        // 두 번째 프레임까지 대기
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            _isDisconnecting = false;
            return;
          }
          
          // 세 번째 프레임까지 대기
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              _isDisconnecting = false;
              return;
            }
            
            // 최종 긴 지연 (Navigator가 완전히 준비될 때까지)
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!mounted) {
                _isDisconnecting = false;
                return;
              }
              
              try {
                // GoRouter를 직접 사용하여 더 안전하게 navigation
                final router = GoRouter.of(context);
                // 현재 경로 확인하여 중복 navigation 방지
                final currentLocation = router.routerDelegate.currentConfiguration.uri.path;
                if (currentLocation != '/receiver') {
                  router.go('/receiver');
                }
                _isDisconnecting = false;
              } catch (e) {
                // Navigation 실패 시 무시 (이미 다른 화면으로 이동했을 수 있음)
                debugPrint('Navigation error during disconnection: $e');
                _isDisconnecting = false;
              }
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(receiverViewModelProvider);

    // [핵심] 연결 끊김 감지 리스너
    // ref.listenManual을 사용하여 build 중에 navigation을 시도하지 않도록 함
    ref.listenManual(
      receiverViewModelProvider,
      (previous, next) {
        final wasConnected = previous?.isConnected ?? false;
        final isConnected = next.isConnected;
        
        // 연결이 끊겼고, 아직 처리 중이 아니면 처리 시작
        if (wasConnected && !isConnected && !_isDisconnecting) {
          _isDisconnecting = true;
          // build 메서드가 완전히 끝난 후에 처리
          // 여러 프레임을 기다려 Navigator가 완전히 unlock될 때까지 대기
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _handleDisconnection();
            }
          });
        }
      },
    );

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
            size: ReceiverScreenConstants.pointerSize,
            inactiveAlpha: ReceiverScreenConstants.pointerAlpha,
            shadowAlpha: ReceiverScreenConstants.shadowAlpha,
            shadowBlurRadius: ReceiverScreenConstants.shadowBlurRadius,
            shadowSpreadRadius: ReceiverScreenConstants.shadowSpreadRadius,
          ),
        ),
      ),
    );
  }
}

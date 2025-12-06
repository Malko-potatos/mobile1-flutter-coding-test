import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';
import 'package:mobile1_flutter_coding_test/core/constants/app_constants.dart';
import 'package:mobile1_flutter_coding_test/core/theme/app_theme.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/constants/constants.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/receiver_viewmodel.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/widgets/widgets.dart';

class ReceiverSetupScreen extends ConsumerStatefulWidget {
  const ReceiverSetupScreen({super.key});

  @override
  ConsumerState<ReceiverSetupScreen> createState() =>
      _ReceiverSetupScreenState();
}

class _ReceiverSetupScreenState extends ConsumerState<ReceiverSetupScreen> {
  String? _ipAddress;
  List<Display> _displays = [];
  Display? _selectedDisplay;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initSetup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 설정 화면에서만 윈도우 설정 원복 (오버레이 화면에서는 실행 안 함)
    // GoRouter의 현재 경로를 확인하여 설정 화면일 때만 원복
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentPath = GoRouterState.of(context).uri.path;
      if (currentPath == '/receiver' && !currentPath.contains('overlay')) {
        _restoreWindowStyle();
      }
    });
  }

  /// 윈도우 설정을 창 모드로 원복합니다.
  Future<void> _restoreWindowStyle() async {
    await windowManager.setSize(ReceiverSetupScreenConstants.setupWindowSize);
    await windowManager.setAlignment(Alignment.center);
    await windowManager.setOpacity(ReceiverSetupScreenConstants.windowOpacity);
    await windowManager.setIgnoreMouseEvents(false);
    await windowManager.setBackgroundColor(Colors.white);
    await windowManager.setAlwaysOnTop(false);
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setHasShadow(true);
  }

  Future<void> _initSetup() async {
    try {
      // 타임아웃 설정 (5초)
      await Future.any([
        _performSetup(),
        Future.delayed(const Duration(seconds: 5), () {
          throw TimeoutException('Setup timeout', const Duration(seconds: 5));
        }),
      ]);
    } catch (e) {
      // 예외 발생 시에도 로딩 상태 해제
      debugPrint('Setup error: $e');
      if (mounted) {
        setState(() {
          _ipAddress = 'Unknown IP';
          _displays = [];
          _selectedDisplay = null;
          _isLoading = false;
        });
      }
    }
  }

  /// 실제 설정 작업을 수행합니다.
  Future<void> _performSetup() async {
    // 1. IP 주소 가져오기 (모든 네트워크 인터페이스에서 IPv4 주소 찾기)
    String? ip = await _getLocalIPAddress();

    // 2. 모니터 목록 가져오기
    List<Display> displays = [];
    try {
      displays = await screenRetriever.getAllDisplays();
    } catch (e) {
      debugPrint('Failed to get displays: $e');
      displays = [];
    }

    // 3. 윈도우 기본 크기 설정 (설정 화면용)
    try {
      await _restoreWindowStyle();
    } catch (e) {
      debugPrint('Failed to restore window style: $e');
      // 윈도우 설정 실패해도 계속 진행
    }

    if (mounted) {
      setState(() {
        _ipAddress = ip ?? 'Unknown IP';
        _displays = displays;
        _selectedDisplay = displays.isNotEmpty ? displays[0] : null;
        _isLoading = false;
      });
    }
  }

  /// 모든 네트워크 인터페이스에서 활성 IPv4 주소를 찾습니다.
  /// WiFi, 이더넷 등 모든 인터페이스를 확인합니다.
  Future<String?> _getLocalIPAddress() async {
    try {
      final interfaces = await NetworkInterface.list(
        includeLinkLocal: false,
        type: InternetAddressType.IPv4,
      );

      // 루프백(127.0.0.1)이 아닌 첫 번째 IPv4 주소 반환
      for (final interface in interfaces) {
        for (final addr in interface.addresses) {
          if (!addr.isLoopback && addr.type == InternetAddressType.IPv4) {
            return addr.address;
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// 선택된 모니터에서 오버레이 모드 시작
  Future<void> _startOverlay() async {
    if (_selectedDisplay == null) return;

    // 선택된 모니터의 좌표와 크기
    final display = _selectedDisplay!;
    final position = display.visiblePosition ?? Offset.zero;

    // 윈도우를 해당 모니터 영역으로 이동 및 크기 조절
    await windowManager.setBounds(Rect.fromLTWH(
      position.dx,
      position.dy,
      display.size.width,
      display.size.height,
    ));

    // 오버레이 스타일 미리 설정 (ReceiverScreen의 initState보다 먼저 실행되도록)
    await windowManager.setAlwaysOnTop(true);
    await windowManager.setHasShadow(false);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    await windowManager.setIgnoreMouseEvents(true);
    await windowManager.setOpacity(1.0);

    // 약간의 지연을 두어 윈도우 설정이 완전히 적용되도록 함
    await Future.delayed(ReceiverSetupScreenConstants.overlayDelay);

    // 페이지 이동 (Navigator가 locked 상태일 수 있으므로 다음 이벤트 루프에서 수행)
    if (!mounted) return;
    Future.microtask(() {
      if (!mounted) return;
      final navigatorContext = context;
      // 추가로 다음 프레임까지 대기
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        navigatorContext.go('/receiver/overlay');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 현재 연결 상태 확인
    final receiverState = ref.watch(receiverViewModelProvider);

    // [핵심] ViewModel 상태 감지 리스너
    ref.listen(receiverViewModelProvider, (previous, next) {
      debugPrint(
          '[ReceiverSetupScreen] State changed: prev=${previous?.isConnected}, next=${next.isConnected}');
      // 연결이 끊겨있다가 -> 연결됨(true) 상태로 바뀌면 오버레이 실행
      final prevConnected = previous?.isConnected ?? false;
      if (!prevConnected && next.isConnected) {
        debugPrint(
            '[ReceiverSetupScreen] Connection detected, starting overlay');
        _startOverlay();
      }
    });

    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: AppTheme.rsupportOrange,
          ),
        ),
      );
    }

    // 디버깅: 연결 상태 표시
    debugPrint(
        '[ReceiverSetupScreen] Build: isLoading=$_isLoading, isConnected=${receiverState.isConnected}, hasPacket=${receiverState.packet != null}');

    return Scaffold(
      appBar: AppBar(
        title: Text(receiverState.isConnected
            ? 'Connected!'
            : 'Waiting for Connection...'),
      ),
      body: Column(
        children: [
          // 연결 상태 표시

          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: QrCodeSection(ipAddress: _ipAddress),
                ),
                const VerticalDivider(
                  width: ReceiverSetupScreenConstants.verticalDividerWidth,
                ),
                Expanded(
                  flex: 1,
                  child: MonitorSelector(
                    displays: _displays,
                    selectedDisplay: _selectedDisplay,
                    onDisplayChanged: (value) {
                      setState(() {
                        _selectedDisplay = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

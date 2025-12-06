import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';
import 'package:mobile1_flutter_coding_test/core/connection/connection_state_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    // 현재 연결 상태 확인 (UI 표시용)
    final connectionState = ref.watch(connectionStateProvider);
    final receiverState = ref.watch(receiverViewModelProvider);

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
        '[ReceiverSetupScreen] Build: isLoading=$_isLoading, isConnected=${connectionState.receiverConnected}, hasPacket=${receiverState.packet != null}');

    return Scaffold(
      appBar: AppBar(
        title: Text(connectionState.receiverConnected
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

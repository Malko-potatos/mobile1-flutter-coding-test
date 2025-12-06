import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/core/router/app_router.dart';
import 'package:window_manager/window_manager.dart';

/// 애플리케이션의 진입점입니다.
///
/// Flutter 바인딩을 초기화하고, 데스크톱 플랫폼인 경우 window_manager를
/// 초기화합니다. 윈도우 스타일 설정은 ReceiverScreen에서 처리합니다.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Desktop specific window setup
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();
  }

  // 전역 에러 핸들러 설정
  _setupErrorHandling();

  runApp(
    const ProviderScope(
      child: MobileLaserPointerApp(),
    ),
  );
}

/// 전역 에러 핸들링을 설정합니다.
void _setupErrorHandling() {
  // 1. Flutter Framework Errors (Layout, Rendering etc.)
  FlutterError.onError = (details) {
    FlutterError.presentError(details); // 콘솔에 덤프
    // ProviderScope가 아직 생성되지 않았으므로 간단한 로깅만 수행
    debugPrint('Flutter Error: ${details.exception}');
  };

  // 2. Platform Errors (Async)
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Global Async Error: $error');
    debugPrintStack(stackTrace: stack);
    return true; // 에러가 처리되었음을 표시
  };
}

/// 모바일 레이저 포인터 애플리케이션의 루트 위젯입니다.
///
/// [routerProvider]를 사용하여 플랫폼에 따라 자동으로 송신기 또는 수신기
/// 화면으로 라우팅합니다.
class MobileLaserPointerApp extends ConsumerWidget {
  /// [MobileLaserPointerApp]을 생성합니다.
  const MobileLaserPointerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // GoRouter는 한 번만 생성되어야 하므로 read 사용
    final router = ref.read(routerProvider);

    return MaterialApp.router(
      title: 'Mobile Laser Pointer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

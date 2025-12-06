import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/core/router/app_router.dart';
import 'package:window_manager/window_manager.dart';

/// 애플리케이션의 진입점입니다.
///
/// Flutter 바인딩을 초기화하고, 데스크톱 플랫폼인 경우 투명하고 항상 위에
/// 표시되는 전체 화면 윈도우를 설정합니다. 그 후 [MobileLaserPointerApp]을
/// 실행합니다.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Desktop specific window setup
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();

    // Configure transparent, always-on-top, full-screen window
    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      center: true,
      backgroundColor: Colors.transparent, // Transparent background
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden, // Hide title bar
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setAlwaysOnTop(true);
      await windowManager.setFullScreen(true);
      await windowManager.setIgnoreMouseEvents(true);
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    const ProviderScope(
      child: MobileLaserPointerApp(),
    ),
  );
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
    final router = ref.watch(routerProvider);

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

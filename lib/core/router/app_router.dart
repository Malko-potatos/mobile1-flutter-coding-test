import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/views/receiver_screen.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/views/receiver_setup_screen.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/views/sender_control_screen.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/views/sender_setup_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
            return '/receiver'; // PC는 설정 화면으로
          } else {
            return '/sender';
          }
        },
      ),
      // [Mobile Flow]
      GoRoute(
        path: '/sender',
        builder: (context, state) => const SenderSetupScreen(), // 신규: 설정 화면
        routes: [
          GoRoute(
            path: 'control',
            builder: (context, state) =>
                const SenderControlScreen(), // 신규: 제어 화면
          ),
        ],
      ),
      // [PC Flow]
      GoRoute(
        path: '/receiver',
        builder: (context, state) => const ReceiverSetupScreen(), // 설정 화면
        routes: [
          GoRoute(
            path: 'overlay',
            builder: (context, state) => const ReceiverScreen(), // 실제 투명 오버레이
          ),
        ],
      ),
    ],
    debugLogDiagnostics: false,
  );
});

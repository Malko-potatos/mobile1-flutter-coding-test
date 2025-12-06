import 'dart:io';
import 'package:flutter/foundation.dart'; // kIsWeb 확인용 (혹시 모를 대비)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/views/receiver_screen.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/views/sender_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // Root 접근 시 플랫폼에 따라 리다이렉트
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (kIsWeb) return '/sender'; // Web 예외 처리 (Optional)

          if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
            return '/receiver';
          } else {
            return '/sender';
          }
        },
      ),
      GoRoute(
        path: '/sender',
        builder: (context, state) => const SenderScreen(),
      ),
      GoRoute(
        path: '/receiver',
        builder: (context, state) => const ReceiverScreen(),
      ),
    ],
  );
});

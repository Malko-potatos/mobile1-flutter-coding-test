import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile1_flutter_coding_test/core/connection/connection_state_provider.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/views/receiver_screen.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/views/receiver_setup_screen.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/views/sender_control_screen.dart';
import 'package:mobile1_flutter_coding_test/features/sender/presentation/views/sender_setup_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 연결 상태 변화를 감지하기 위한 Listenable 래퍼
  final connectionStateListenable = _ConnectionStateListenable(ref);

  final router = GoRouter(
    initialLocation: '/',
    // 연결 상태 변화 시 redirect 재평가를 위한 refreshListenable
    refreshListenable: connectionStateListenable,
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
      // [Mobile Flow] - 송신기 쪽은 명시적 내비게이션 사용 (redirect 최소화)
      GoRoute(
        path: '/sender',
        builder: (context, state) => const SenderSetupScreen(),
        routes: [
          GoRoute(
            path: 'control',
            builder: (context, state) => const SenderControlScreen(),
          ),
        ],
      ),
      // [PC Flow]
      GoRoute(
        path: '/receiver',
        redirect: (context, state) {
          final connectionState = connectionStateListenable.currentState;
          // 연결되지 않은 상태에서 오버레이 화면 접근 시 설정 화면으로 리다이렉트
          if (!connectionState.receiverConnected &&
              state.uri.path == '/receiver/overlay') {
            return '/receiver';
          }
          // 연결된 상태에서 설정 화면 접근 시 오버레이 화면으로 리다이렉트
          if (connectionState.receiverConnected &&
              state.uri.path == '/receiver') {
            return '/receiver/overlay';
          }
          return null; // 리다이렉트 없음
        },
        builder: (context, state) => const ReceiverSetupScreen(),
        routes: [
          GoRoute(
            path: 'overlay',
            redirect: (context, state) {
              final connectionState = connectionStateListenable.currentState;
              // 연결이 끊기면 설정 화면으로 리다이렉트
              if (!connectionState.receiverConnected) {
                return '/receiver';
              }
              return null; // 리다이렉트 없음
            },
            builder: (context, state) => const ReceiverScreen(),
          ),
        ],
      ),
    ],
    debugLogDiagnostics: false,
  );

  return router;
});

/// Riverpod의 StateNotifier를 GoRouter의 refreshListenable로 사용하기 위한 래퍼 클래스
class _ConnectionStateListenable extends ChangeNotifier {
  final Ref _ref;
  ConnectionState _currentState;

  _ConnectionStateListenable(this._ref)
      : _currentState = const ConnectionState() {
    // 초기 상태 설정
    _currentState = _ref.read(connectionStateProvider);

    // 연결 상태 변화를 감지하여 notifyListeners 호출
    _ref.listen<ConnectionState>(
      connectionStateProvider,
      (previous, next) {
        _currentState = next;
        notifyListeners();
      },
    );
  }

  /// 현재 연결 상태를 반환합니다.
  ConnectionState get currentState => _currentState;
}

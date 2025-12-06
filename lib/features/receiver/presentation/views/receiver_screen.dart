import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/presentation/viewmodels/receiver_viewmodel.dart';

/// 투명한 윈도우에 레이저 포인터를 표시합니다.
///
/// [receiverViewModelProvider]를 구독하여 수신된 [LaserPacket] 데이터를
/// 기반으로 화면에 레이저 포인터를 렌더링합니다. 패킷의 좌표와 클릭 상태에
/// 따라 포인터의 위치와 색상을 업데이트합니다.
class ReceiverScreen extends ConsumerWidget {
  /// [ReceiverScreen]을 생성합니다.
  const ReceiverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packetAsync = ref.watch(receiverViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        // [시각화] 앱이 실행 중임을 알리는 테두리 (녹색: 대기중, 빨강: 수신중)
        decoration: BoxDecoration(
          border: Border.all(
            color: packetAsync.hasValue
                ? Colors.red.withValues(alpha: 0.5)
                : Colors.green.withValues(alpha: 0.5),
            width: 4.0, // 테두리 두께
          ),
        ),
        child: packetAsync.when(
          data: (packet) {
            return Stack(
              children: [
                // 좌표 디버깅 정보 (Click-through 상태라 드래그/복사 불가, 눈으로만 확인)
                Positioned(
                  top: 50,
                  left: 50,
                  child: Text(
                    'Connected\nX: ${packet.x.toStringAsFixed(2)}\nY: ${packet.y.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                    ),
                  ),
                ),
                // 레이저 포인터
                Align(
                  // Alignment 좌표계: (-1.0 ~ 1.0)
                  alignment: Alignment(packet.x, packet.y),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: packet.c
                          ? Colors.red
                          : Colors.red.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withValues(alpha: 0.8),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          error: (err, stack) => Center(
              child: Text('Error: $err',
                  style: const TextStyle(color: Colors.red))),
          loading: () => const Center(
            child: Text(
              'Waiting for Sender...',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
      backgroundColor: Colors.transparent, // Essential for transparency
      body: packetAsync.when(
        data: (packet) {
          // TODO: packet.x, packet.y는 0.0~1.0 정규화된 좌표라 가정하고 화면 크기에 매핑해야 함.

          return Stack(
            children: [
              // Debug Info (Optional)
              Positioned(
                top: 50,
                left: 50,
                child: Text(
                  'X: ${packet.x.toStringAsFixed(2)}, Y: ${packet.y.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
              // Laser Pointer Visual
              // Note: Actual positioning logic requires Screen Size calculation
              Align(
                alignment: Alignment(
                    packet.x, packet.y), // 임시: Alignment 사용 (-1.0 ~ 1.0)
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
            child:
                Text('Error: $err', style: const TextStyle(color: Colors.red))),
        loading: () => const Center(
          child: Text(
            'Waiting for Sender...',
            style: TextStyle(color: Colors.grey, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

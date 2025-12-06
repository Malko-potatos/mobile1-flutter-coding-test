import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';
import 'package:mobile1_flutter_coding_test/features/receiver/data/receiver_repository.dart';

/// 수신된 [LaserPacket] 스트림을 노출합니다.
///
/// UI는 이 프로바이더를 구독하여 포인터 위치를 업데이트합니다.
/// [receiverRepositoryProvider]를 통해 UDP 소켓에서 패킷을 수신하고
/// 스트림으로 변환합니다.
final receiverViewModelProvider =
    StreamProvider.autoDispose<LaserPacket>((ref) {
  final repository = ref.watch(receiverRepositoryProvider);
  return repository.getPacketStream();
});

import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile1_flutter_coding_test/core/constants/app_constants.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';

/// 레이저 데이터 수신을 위한 UDP 소켓에 접근할 수 있도록 제공합니다.
final receiverRepositoryProvider = Provider((ref) => ReceiverRepository());

/// UDP 소켓 바인딩 및 패킷 파싱을 처리합니다.
class ReceiverRepository {
  /// UDP 소켓을 열고 [LaserPacket] 스트림을 생성합니다.
  ///
  /// [AppConstants.port]에서 [InternetAddress.anyIPv4]에 바인딩합니다.
  /// JSON 문자열을 디코딩하여 [LaserPacket] 객체로 변환합니다.
  ///
  /// 잘못된 형식의 패킷은 무시하고 스트림을 유지합니다.
  /// 바인딩 실패 시 [SocketException]을 발생시킵니다.
  Stream<LaserPacket> getPacketStream() async* {
    try {
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        AppConstants.port,
      );

      // Listen to socket events
      await for (final event in socket) {
        if (event == RawSocketEvent.read) {
          final datagram = socket.receive();
          if (datagram != null) {
            try {
              final message = utf8.decode(datagram.data);
              final json = jsonDecode(message) as Map<String, dynamic>;
              yield LaserPacket.fromJson(json);
            } catch (e) {
              // Ignore malformed packets to maintain stream stability
              continue;
            }
          }
        }
      }
    } catch (e) {
      // 바인딩 오류 발생 시 [SocketException]을 발생시킵니다.
      throw SocketException('Failed to bind UDP socket: $e');
    }
  }
}

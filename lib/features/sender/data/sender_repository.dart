import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/core/constants/app_constants.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';

part 'sender_repository.g.dart';

/// UDP 전송 기능에 접근할 수 있도록 제공합니다.
@riverpod
SenderRepository senderRepository(Ref ref) {
  return SenderRepository();
}

/// 송신기를 위한 저수준 UDP 소켓 작업을 처리합니다.
class SenderRepository {
  RawDatagramSocket? _socket;

  /// UDP 소켓을 초기화합니다.
  ///
  /// 송신기는 고정된 수신 포트가 필요 없으므로
  /// [InternetAddress.anyIPv4]의 포트 0 (사용 가능한 랜덤 포트)에 바인딩합니다.
  Future<void> initSocket() async {
    if (_socket != null) {
      debugPrint('[SenderRepository] Socket already initialized');
      return;
    }
    
    try {
      debugPrint('[SenderRepository] Initializing socket...');
      _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      debugPrint('[SenderRepository] Socket initialized: ${_socket?.address}:${_socket?.port}');
    } catch (e) {
      // 초기화 오류 처리 (예: 권한 확인)
      debugPrint('[SenderRepository] Error initializing socket: $e');
    }
  }

  /// 지정된 [ipAddress]로 [LaserPacket]을 전송합니다.
  ///
  /// 패킷을 JSON으로 직렬화하여 UDP로 [AppConstants.port]에 전송합니다.
  /// 소켓이 초기화되지 않은 경우 이 메서드는 아무 작업도 수행하지 않습니다.
  void sendPacket(LaserPacket packet, String ipAddress) {
    if (_socket == null) {
      debugPrint('[SenderRepository] Cannot send: Socket is null');
      return;
    }

    try {
      final targetAddress = InternetAddress(ipAddress);
      final jsonData = jsonEncode(packet.toJson());
      final data = utf8.encode(jsonData);

      debugPrint('[SenderRepository] Sending packet to $ipAddress:${AppConstants.port} - x=${packet.x}, y=${packet.y}, c=${packet.c}');
      final bytesSent = _socket!.send(data, targetAddress, AppConstants.port);
      debugPrint('[SenderRepository] Packet sent: $bytesSent bytes');
    } catch (e) {
      // UDP에서 전송 실패(예: 도달 불가능한 호스트)는 여기서 항상 throw되지 않을 수 있지만,
      // 잘못된 IP 형식이나 소켓 오류는 throw됩니다.
      // 디버깅을 위해 콘솔에 출력하지만 앱 크래시는 방지합니다.
      debugPrint('[SenderRepository] UDP Send Error: $e');
    }
  }

  /// 소켓을 닫고 리소스를 해제합니다.
  void dispose() {
    _socket?.close();
    _socket = null;
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/core/constants/app_constants.dart';
import 'package:mobile1_flutter_coding_test/domain/models/laser_packet.dart';

part 'receiver_repository.g.dart';

/// 레이저 데이터 수신을 위한 UDP 소켓에 접근할 수 있도록 제공합니다.
@riverpod
ReceiverRepository receiverRepository(Ref ref) {
  return ReceiverRepository();
}

/// UDP 소켓 바인딩 및 패킷 파싱을 처리합니다.
///
/// 싱글톤 스타일로 소켓을 한 번만 바인딩하고 스트림을 계속 유지합니다.
/// 중복 바인딩을 방지하여 리소스 낭비를 막습니다.
class ReceiverRepository {
  RawDatagramSocket? _socket;
  final StreamController<LaserPacket> _packetController =
      StreamController<LaserPacket>.broadcast();
  bool _isInitializing = false;
  bool _isInitialized = false;

  ReceiverRepository() {
    // 비동기 초기화는 별도로 처리
    _initSocket();
  }
  
  /// 소켓이 초기화되었는지 확인합니다.
  bool get isInitialized => _isInitialized;

  /// UDP 소켓을 초기화하고 패킷 수신을 시작합니다.
  ///
  /// 이미 소켓이 열려있으면 중복 바인딩을 방지합니다.
  Future<void> _initSocket() async {
    // 이미 초기화되었거나 초기화 중이면 패스
    if (_isInitialized || _isInitializing) {
      debugPrint('[ReceiverRepository] Socket already initialized or initializing');
      return;
    }

    _isInitializing = true;
    
    try {
      debugPrint('[ReceiverRepository] Initializing socket on port ${AppConstants.port}');
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        AppConstants.port,
      );

      debugPrint('[ReceiverRepository] Socket bound successfully: ${_socket?.address}:${_socket?.port}');

      _socket!.listen(
        (RawSocketEvent event) {
          switch (event) {
            case RawSocketEvent.read:
              final datagram = _socket?.receive();
              if (datagram != null) {
                debugPrint('[ReceiverRepository] Packet received from ${datagram.address}:${datagram.port}');
                _processDatagram(datagram);
              }
            case RawSocketEvent.write:
            case RawSocketEvent.readClosed:
            case RawSocketEvent.closed:
              debugPrint('[ReceiverRepository] Socket event: $event');
              // 다른 이벤트는 무시
              break;
          }
        },
        onError: (error) {
          debugPrint('[ReceiverRepository] Socket error: $error');
        },
        onDone: () {
          debugPrint('[ReceiverRepository] Socket stream done');
        },
        cancelOnError: false,
      );
      
      _isInitialized = true;
      debugPrint('[ReceiverRepository] Socket initialization completed');
    } catch (e) {
      // Socket binding error - 로깅만 수행 (앱 크래시 방지)
      debugPrint('[ReceiverRepository] Socket binding error: $e');
      _isInitialized = false;
    } finally {
      _isInitializing = false;
    }
  }

  /// 수신된 데이터그램을 파싱하여 패킷 스트림에 추가합니다.
  void _processDatagram(Datagram datagram) {
    try {
      final message = utf8.decode(datagram.data);
      final json = jsonDecode(message) as Map<String, dynamic>;
      final packet = LaserPacket.fromJson(json);
      debugPrint('[ReceiverRepository] Parsed packet: x=${packet.x}, y=${packet.y}, c=${packet.c}');
      _packetController.add(packet);
    } catch (e) {
      // Malformed packets are silently ignored
      debugPrint('[ReceiverRepository] Failed to parse packet: $e');
    }
  }

  /// 패킷 수신 스트림을 반환합니다.
  Stream<LaserPacket> getPacketStream() {
    return _packetController.stream;
  }

  /// 소켓을 닫고 리소스를 정리합니다.
  void close() {
    _socket?.close();
    _packetController.close();
  }
}

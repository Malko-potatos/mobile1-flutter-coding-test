// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laser_packet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LaserPacket _$LaserPacketFromJson(Map<String, dynamic> json) => _LaserPacket(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      c: json['c'] as bool? ?? false,
    );

Map<String, dynamic> _$LaserPacketToJson(_LaserPacket instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'c': instance.c,
    };

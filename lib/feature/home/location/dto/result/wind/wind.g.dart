// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindDTO _$WindDTOFromJson(Map<String, dynamic> json) => WindDTO(
      speed: (json['speed'] as num).toDouble(),
      deg: json['deg'] as int,
    );

Map<String, dynamic> _$WindDTOToJson(WindDTO instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

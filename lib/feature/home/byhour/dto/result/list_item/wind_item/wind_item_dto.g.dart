// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindItemDTO _$WindItemDTOFromJson(Map<String, dynamic> json) => WindItemDTO(
      (json['speed'] as num).toDouble(),
      json['deg'] as int,
      (json['gust'] as num).toDouble(),
    );

Map<String, dynamic> _$WindItemDTOToJson(WindItemDTO instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

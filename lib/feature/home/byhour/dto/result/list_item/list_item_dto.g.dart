// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListItemDTO _$ListItemDTOFromJson(Map<String, dynamic> json) => ListItemDTO(
      json['dt'] as int,
      MainItemDTO.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      CloudsAllItemDTO.fromJson(json['clouds'] as Map<String, dynamic>),
      WindItemDTO.fromJson(json['wind'] as Map<String, dynamic>),
      json['visibility'] as int,
      (json['pop'] as num).toDouble(),
      SysItemDTO.fromJson(json['sys'] as Map<String, dynamic>),
      json['dt_txt'] as String,
    );

Map<String, dynamic> _$ListItemDTOToJson(ListItemDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dt_txt,
    };

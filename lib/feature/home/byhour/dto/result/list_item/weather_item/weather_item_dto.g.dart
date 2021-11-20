// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherItemDTO _$WeatherItemDTOFromJson(Map<String, dynamic> json) =>
    WeatherItemDTO(
      json['id'] as int,
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherItemDTOToJson(WeatherItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

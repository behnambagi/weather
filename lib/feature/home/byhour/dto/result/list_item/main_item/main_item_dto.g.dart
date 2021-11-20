// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainItemDTO _$MainItemDTOFromJson(Map<String, dynamic> json) => MainItemDTO(
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['temp_min'] as num).toDouble(),
      (json['temp_max'] as num).toDouble(),
      json['pressure'] as int,
      json['sea_level'] as int,
      json['grnd_level'] as int,
      json['humidity'] as int,
      (json['temp_kf'] as num).toDouble(),
    );

Map<String, dynamic> _$MainItemDTOToJson(MainItemDTO instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
      'humidity': instance.humidity,
      'temp_kf': instance.tempKf,
    };

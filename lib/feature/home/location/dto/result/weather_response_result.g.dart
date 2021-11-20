// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseResult _$WeatherResponseResultFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseResult(
      lonLat: LonLatDTO.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: MainDTO.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      wind: WindDTO.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: CloudsAllDTO.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      sys: SysDTO.fromJson(json['sys'] as Map<String, dynamic>),
      timoZone: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      cod: json['cod'] as int,
    );

Map<String, dynamic> _$WeatherResponseResultToJson(
        WeatherResponseResult instance) =>
    <String, dynamic>{
      'coord': instance.lonLat,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timoZone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

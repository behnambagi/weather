// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDTO _$CityDTOFromJson(Map<String, dynamic> json) => CityDTO(
      json['id'] as int,
      json['name'] as String,
      CoordItemTDO.fromJson(json['coord'] as Map<String, dynamic>),
      json['country'] as String,
      json['population'] as int,
      json['timezone'] as int,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$CityDTOToJson(CityDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

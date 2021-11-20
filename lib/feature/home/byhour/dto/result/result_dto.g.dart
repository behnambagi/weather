// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourResponseResult _$HourResponseResultFromJson(Map<String, dynamic> json) =>
    HourResponseResult(
      json['cod'] as String,
      json['message'] as int,
      json['cnt'] as int,
      (json['list'] as List<dynamic>)
          .map((e) => ListItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      CityDTO.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourResponseResultToJson(HourResponseResult instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

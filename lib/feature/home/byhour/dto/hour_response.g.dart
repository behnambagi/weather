// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourResponse _$HourResponseFromJson(Map<String, dynamic> json) => HourResponse(
      json['status'] as int,
      HourResponseResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourResponseToJson(HourResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

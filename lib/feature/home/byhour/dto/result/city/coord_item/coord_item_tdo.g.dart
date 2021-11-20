// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord_item_tdo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordItemTDO _$CoordItemTDOFromJson(Map<String, dynamic> json) => CoordItemTDO(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordItemTDOToJson(CoordItemTDO instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

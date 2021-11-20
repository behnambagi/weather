import 'package:json_annotation/json_annotation.dart';
import 'package:weather/feature/home/location/dto/result/clouds/clouds_all_dto.dart';
import 'package:weather/feature/home/location/dto/result/sys/sys.dart';
import 'package:weather/feature/home/location/dto/result/weather/weather.dart';
import 'package:weather/feature/home/location/dto/result/wind/wind.dart';

import 'lat_lon/lon_lat.dart';
import 'main/main.dart';

part 'weather_response_result.g.dart';

//done this file

@JsonSerializable()
class WeatherResponseResult {
  @JsonKey(name: 'coord')
  final LonLatDTO lonLat;

  @JsonKey(name: 'weather')
  final List<WeatherDTO> weather;

  final String base;
  final MainDTO main;
  final int visibility;

  final WindDTO wind;
  CloudsAllDTO clouds;
  final int dt;

  @JsonKey(name: 'sys')
  final SysDTO sys;

  @JsonKey(name: 'timezone')
  final int timoZone;

  final int id;
  final String name;
  final int cod;

  WeatherResponseResult(
      {required this.lonLat, required this.weather, required this.base,
        required this.main, required this.visibility, required this.wind,
        required this.clouds, required this.dt, required this.sys,
        required this.timoZone, required this.id, required this.name, required this.cod});

  factory WeatherResponseResult.fromJson(Map<String, dynamic> json) {
    return _$WeatherResponseResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherResponseResultToJson(this);
}

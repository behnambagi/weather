import 'package:json_annotation/json_annotation.dart';
import 'package:weather/feature/home/location/dto/result/weather_response_result.dart';

part 'weather_response.g.dart';

//done this file

@JsonSerializable()
class WeatherResponse {

  final int status;
  final WeatherResponseResult result;

  WeatherResponse(
      {required this.result, required this.status});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return _$WeatherResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

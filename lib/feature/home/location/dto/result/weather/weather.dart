import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

//done this file


@JsonSerializable()
class WeatherDTO{

  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherDTO({ required this.id,  required this.main,  required this.description,  required this.icon});

  factory WeatherDTO.fromJson(Map<String , dynamic> json){
    return _$WeatherDTOFromJson(json);
  }

  Map<String, dynamic> toJson()=> _$WeatherDTOToJson(this);

}
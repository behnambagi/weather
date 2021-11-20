import 'package:json_annotation/json_annotation.dart';

part 'weather_item_dto.g.dart';

//done this file

@JsonSerializable()
class WeatherItemDTO{
  int id;
  String main;
  String description;
  String icon;

  WeatherItemDTO(this.id, this.main, this.description, this.icon);


  factory WeatherItemDTO.fromJson(Map<String, dynamic> json) {
    return _$WeatherItemDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherItemDTOToJson(this);
}
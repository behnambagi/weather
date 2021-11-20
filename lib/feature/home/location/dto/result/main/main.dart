import 'package:json_annotation/json_annotation.dart';
part 'main.g.dart';

//done this file


@JsonSerializable()
class MainDTO{

  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;

  MainDTO(
      { required this.temp,
       required this.feelsLike,
       required this.tempMin,
       required this.tempMax,
       required this.pressure,
       required this.humidity});

  factory MainDTO.fromJson(Map<String, dynamic> json){
    return _$MainDTOFromJson(json);
  }

  Map<String, dynamic> toJson()=> _$MainDTOToJson(this);
}
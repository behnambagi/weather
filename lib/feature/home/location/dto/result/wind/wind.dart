import 'package:json_annotation/json_annotation.dart';
part 'wind.g.dart';

//done this file

@JsonSerializable()
class WindDTO{
  final double speed;
  final int deg;

  WindDTO({required this.speed, required this.deg});

  factory WindDTO.fromJson(Map<String, dynamic> json){
    return _$WindDTOFromJson(json);
  }

  Map<String, dynamic> toJson()=> _$WindDTOToJson(this);

}
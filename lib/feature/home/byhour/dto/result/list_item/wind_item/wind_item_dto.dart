import 'package:json_annotation/json_annotation.dart';

part 'wind_item_dto.g.dart';


//done this file

@JsonSerializable()
class WindItemDTO{

  double speed;
  int deg;
  double gust;

  WindItemDTO(this.speed, this.deg, this.gust);



  factory WindItemDTO.fromJson(Map<String, dynamic> json) {
    return _$WindItemDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WindItemDTOToJson(this);
}
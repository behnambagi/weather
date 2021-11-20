import 'package:json_annotation/json_annotation.dart';
import 'coord_item/coord_item_tdo.dart';

part 'city_dto.g.dart';

//done this file

@JsonSerializable()
class CityDTO{
  int id;
  String name;
  CoordItemTDO coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  CityDTO(this.id, this.name, this.coord, this.country, this.population,
      this.timezone, this.sunrise, this.sunset);

  factory CityDTO.fromJson(Map<String, dynamic> json) {
    return _$CityDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityDTOToJson(this);

}
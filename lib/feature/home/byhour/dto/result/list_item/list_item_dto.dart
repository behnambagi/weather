



import 'package:json_annotation/json_annotation.dart';
import 'package:weather/feature/home/byhour/dto/result/list_item/sys_item/sys_item_dto.dart';
import 'package:weather/feature/home/byhour/dto/result/list_item/weather_item/weather_item_dto.dart';
import 'package:weather/feature/home/byhour/dto/result/list_item/wind_item/wind_item_dto.dart';

import 'clouds_All_item/clouds_all_item_dto.dart';
import 'main_item/main_item_dto.dart';


part 'list_item_dto.g.dart';


@JsonSerializable()
class ListItemDTO{

  int dt;
  MainItemDTO main;
  List<WeatherItemDTO> weather;
  CloudsAllItemDTO clouds;
  WindItemDTO wind;
  int visibility;
  double pop;
  SysItemDTO sys;
  String dt_txt;

  ListItemDTO(this.dt, this.main, this.weather, this.clouds, this.wind,
      this.visibility, this.pop, this.sys, this.dt_txt);

  factory ListItemDTO.fromJson(Map<String, dynamic> json) {
    return _$ListItemDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListItemDTOToJson(this);
}
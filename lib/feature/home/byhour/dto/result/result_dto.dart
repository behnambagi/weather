import 'package:json_annotation/json_annotation.dart';

import 'city/city_dto.dart';
import 'list_item/list_item_dto.dart';


part 'result_dto.g.dart';

//done this file

@JsonSerializable()
class HourResponseResult {
  String cod;
  int message;
  int cnt;
  List<ListItemDTO> list;
  CityDTO city;

  HourResponseResult(this.cod, this.message, this.cnt, this.list, this.city,);



  factory HourResponseResult.fromJson(Map<String, dynamic> json) {
    return _$HourResponseResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HourResponseResultToJson(this);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/feature/home/byhour/dto/result/result_dto.dart';

part 'hour_response.g.dart';

//done this file

@JsonSerializable()
class HourResponse{

  int status;
  HourResponseResult result;

  HourResponse(this.status, this.result);

  factory HourResponse.fromJson(Map<String, dynamic> json) {
    return _$HourResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HourResponseToJson(this);
}
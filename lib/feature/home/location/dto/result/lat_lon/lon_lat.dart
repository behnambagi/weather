import 'package:json_annotation/json_annotation.dart';

part 'lon_lat.g.dart';

//done this file

@JsonSerializable()
class LonLatDTO {
  final double lon;
  final double lat;

  LonLatDTO({ required this.lon,  required this.lat});

  factory LonLatDTO.fromJson(Map<String, dynamic> json) =>
      _$LonLatDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LonLatDTOToJson(this);
}

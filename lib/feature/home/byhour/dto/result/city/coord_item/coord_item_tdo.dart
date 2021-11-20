import 'package:json_annotation/json_annotation.dart';

part 'coord_item_tdo.g.dart';

//done this file

@JsonSerializable()
class CoordItemTDO{
  double lat;
  double lon;

  CoordItemTDO(this.lat, this.lon);

  factory CoordItemTDO.fromJson(Map<String, dynamic> json) {
    return _$CoordItemTDOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoordItemTDOToJson(this);

}

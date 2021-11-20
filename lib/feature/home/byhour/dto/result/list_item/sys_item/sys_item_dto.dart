import 'package:json_annotation/json_annotation.dart';


part 'sys_item_dto.g.dart';


//done this file

@JsonSerializable()
class SysItemDTO{

  String pod;

  SysItemDTO(this.pod);

  factory SysItemDTO.fromJson(Map<String, dynamic> json) {
    return _$SysItemDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SysItemDTOToJson(this);
}
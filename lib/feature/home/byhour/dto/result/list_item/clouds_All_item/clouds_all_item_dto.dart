import 'package:json_annotation/json_annotation.dart';

part 'clouds_all_item_dto.g.dart';

//done this file

@JsonSerializable()
class CloudsAllItemDTO{
  int all;

  CloudsAllItemDTO(this.all);


  factory CloudsAllItemDTO.fromJson(Map<String, dynamic> json) {
    return _$CloudsAllItemDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CloudsAllItemDTOToJson(this);

}
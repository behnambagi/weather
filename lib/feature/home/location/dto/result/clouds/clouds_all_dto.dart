import 'package:json_annotation/json_annotation.dart';

part 'clouds_all_dto.g.dart';

//done this file

@JsonSerializable()
class CloudsAllDTO{

  int all;

  CloudsAllDTO(this.all);

  factory CloudsAllDTO.fromJson(Map<String, dynamic> json) =>
      _$CloudsAllDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsAllDTOToJson(this);
}

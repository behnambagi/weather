import 'package:json_annotation/json_annotation.dart';
part 'sys.g.dart';

//done this file

@JsonSerializable()
class SysDTO{

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysDTO({ required this.type,  required this.id,  required this.country,  required this.sunrise,  required this.sunset});


  factory SysDTO.fromJson(Map<String, dynamic> json){
    return _$SysDTOFromJson(json);
  }

  Map<String, dynamic> toJson()=> _$SysDTOToJson(this);
}
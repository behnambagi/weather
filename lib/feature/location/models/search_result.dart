import 'package:latlong2/latlong.dart';

class SearchResult{
  final String id;
  final String text;
  final String placeName;
  final LatLng latLng;
  const SearchResult({required this.id, required this.text, required this.placeName, required this.latLng});

  factory SearchResult.fromMap(Map<String, dynamic> map){
    var latLng = (map['center'] as List);
    return SearchResult(text: map['text'],
        placeName: map['place_name'], id: map['id'],
        latLng: LatLng(latLng.last, latLng.first) );
  }


}
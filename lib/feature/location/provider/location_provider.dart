import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/core/api_client/api_client.dart';
import 'package:weather_app/core/utils.dart';

import '../../home/provider/location_controller.dart';
import '../models/search_result.dart';

class LocationProvider extends ChangeNotifier{
  final GPSController _controller = GPSController();

  LatLng latLong = LatLng(35.699444, 51.337776);
  List<SearchResult> listResult =[];

  final ApiClient _client = ApiClient(Dio());

  Future<List<SearchResult>> searchCity(String text)async{
   var res = await _client.searchCity(text, {"access_token":InitValue.tokenMapBox});
   var listItems = ((res as Map)["features"]) as List;
   if (kDebugMode) print(listItems.map((e) => SearchResult.fromMap(e)).toList().length);
   listen();
    return listItems.map((e) => SearchResult.fromMap(e)).toList();
  }

  void gpsLocation(mapController)async{
    var position = await _controller.start();
    latLong = LatLng(position?.latitude??0.0, position?.longitude??0.0);
    mapController.move(latLong, 13);
    listen();
  }

  void listen()=>notifyListeners();

}
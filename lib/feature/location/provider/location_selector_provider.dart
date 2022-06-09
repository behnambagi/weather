import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../../home/provider/location_controller.dart';

class LocationSelectorProvider extends ChangeNotifier{
  final LocationController controller = LocationController();

  LatLng latLong = LatLng(35.699444, 51.337776);


  void gpsLocation()async{
    var position = await controller.start();
    latLong = LatLng(position?.latitude??0.0, position?.longitude??0.0);
    listen();
  }


  void listen()=>notifyListeners();




}
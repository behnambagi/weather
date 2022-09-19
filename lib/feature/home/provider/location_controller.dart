import 'package:geolocator/geolocator.dart';

class GPSController{
  Future<Position> setLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.toString());
    return position;
  }

 Future<bool> checkPermission()async{
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var check = await Geolocator.checkPermission();
    print(check);
    switch(check) {
      case LocationPermission.denied: return false;
      case LocationPermission.deniedForever:return false;
      default: return true;
    }
  }

  Future<Position?> start()async{
   var res =await checkPermission();
   if(!res) return null;
   var position = await setLocation();
   return position;
  }

}
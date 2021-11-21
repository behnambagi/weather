import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/api_client/api_client.dart';
import 'package:weather/feature/home/byhour/dto/hour_response.dart';
import 'package:weather/feature/home/location/dto/result/weather_response_result.dart';
import 'package:weather/feature/home/location/dto/weather_response.dart';

class HomeProvider extends ChangeNotifier {
  ApiClient _apiClient = ApiClient(Dio());
  late WeatherResponse _weather;
  late HourResponse _byHour;
  List _list = [];
  double? _lat = 35.7367808;
  double? _long = 51.4228224;
  String? _city;

  void setLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _lat = position.latitude;
    _long = position.longitude;
    notifyListeners();
  }


  Future<bool> sendToApi() async {

    var _resultLocation = await _apiClient.location({"lat": _lat, "lng": _long},
        "service.rsczuYOA7OikWOXhn4d4CMQE0pI3lsePqulp25CK");
    _city = _resultLocation['state'];
    var _list = _city!.split(' ');
    _city = _list[1];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', _city!);

    Map<String, dynamic> _mapWeather = {
      "token": "987231:618cd826e8c5d1.13098129",
      "action": 'now',
      "city": city
    };
    _weather = await _apiClient.getWeather(_mapWeather);


    getDetail();
    Map<String, dynamic> _mapByHour = {
      "token": "987231:618cd826e8c5d1.13098129",
      "action": 'byhour',
      "city": city
    };
    _byHour = await _apiClient.getWeatherByHour(_mapByHour);
    return true;
  }

  Future<bool> stateChange(bool _result) async {
     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var _check = await Geolocator.checkPermission();
    if (_check == LocationPermission.always || _check==LocationPermission.whileInUse) {
      var _prefs =await SharedPreferences.getInstance();
      _prefs.setBool('state', _result);

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void getDetail(){
    _list.add(weather.wind.speed);
    _list.add(weather.main.humidity);
    _list.add(weather.main.tempMax);
    _list.add(weather.main.pressure);
    _list.add(weather.visibility);
    _list.add(weather.main.tempMin);
  }

  WeatherResponseResult get weather => _weather.result;

  HourResponse get byHour => _byHour;

  String? get city => _city;

  List get list => _list;
}

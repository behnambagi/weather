import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weathera_app/feature/home/provider/location_controller.dart';

import '../../../core/utils.dart';

class HomeProvider extends ChangeNotifier {
  final _wfClient = WeatherFactory(InitValue.tokenOpenWeather, language: Language.PERSIAN);
  late Weather _weather;
  late List<Weather> _fiveDay;
  final List _list = [];

  late Future<bool> futureInitHome = initHome(InitValue.myCity);

  Future<bool> _saveCity(String city)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('city', city);
  }

  Future<bool> sendToApi() async {
    var controller = LocationController();
    Position? position = await controller.start();
    if(position==null) return false;
    _weather =await _wfClient.currentWeatherByLocation(position.longitude, position.longitude);
    await _saveCity(weather.areaName??"تهران");
    notifyListeners();
    return true;
  }

  Future<bool> initHome(String city) async {
    _weather =await _wfClient.currentWeatherByCityName(city);
    _fiveDay = await _wfClient.fiveDayForecastByCityName(city);
    await _getDetail();
    notifyListeners();
    return true;
  }

  _getDetail(){
    _list.add(weather.windSpeed);
    _list.add(weather.humidity);
    _list.add(weather.tempMax?.celsius??0.0);
    _list.add(weather.pressure);
    _list.add(weather.pressure);
    _list.add(weather.tempMin?.celsius??0.0);
  }

  Weather get weather => _weather;

  List<Weather> get fiveDay => _fiveDay;

  List get list => _list;
}

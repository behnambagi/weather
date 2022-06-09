part of utils;
class InitValue{
  static String myCity = 'tehran';
  static String tokenOpenWeather = "f5930c6e7ae40e126b7a409358c5097e";

  static Future<String?> getLocation() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? city = prefs.getString('city');
     if(city==null) return null;
     myCity = prefs.getString('city')!;
     return myCity;
}

}
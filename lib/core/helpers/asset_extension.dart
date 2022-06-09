part of helpers_app;

extension AssetExtension on AssetEnum{
  String get patch {
     switch(this){
       case AssetEnum.asset :return "assets/";
       case AssetEnum.images :return "assets/images/";
       case AssetEnum.weatherIcon :return "assets/images/weather_icon/";
     }
  }
}
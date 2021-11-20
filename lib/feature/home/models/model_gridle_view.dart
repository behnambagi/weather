class DetailModel {
  String nWindSpeed;
  double windSpeed;
  String nHumidity;
  int humidity;
  String nCloudsAll;
  int cloudsAll;
  String nPressure;
  int pressure;
  String nVisibility;
  int visibility;
  String nDwPoint;
  double dewPoint;

  DetailModel(
      {required this.nWindSpeed,
      required this.windSpeed,
      required this.nHumidity,
      required this.humidity,
      required this.nCloudsAll,
      required this.cloudsAll,
      required this.nPressure,
      required this.pressure,
      required this.nVisibility,
      required this.visibility,
      required this.nDwPoint,
      required this.dewPoint});
}
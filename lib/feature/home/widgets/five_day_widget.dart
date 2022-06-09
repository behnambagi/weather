part of home;

class _FiveDayWidget extends StatelessWidget {
  _FiveDayWidget({Key? key, required this.weather}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    var temp = weather.temperature?.celsius??0.0;
    var dt = weather.date.toString();
    return SizedBox(
      width: 170,
      child: Center(
        child: Column(
          children: [
            Image.network("http://openweathermap.org/img/wn/${weather.weatherIcon}@2x.png"),
            Text(dt.split(' ').first),
            Text(weather.weatherDescription??""),
            Text('${temp.toStringAsFixed(2)}°C')
          ],
        ),
      ),
    );
  }
}

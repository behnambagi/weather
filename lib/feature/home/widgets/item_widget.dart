import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var icon = Provider.of<HomeProvider>(context).byHour.result.list[index].weather[0].icon;
    var d = Provider.of<HomeProvider>(context).byHour.result.list[index].weather[0].description;
    var t = Provider.of<HomeProvider>(context).byHour.result.list[index].main.temp;
    var dt = Provider.of<HomeProvider>(context).byHour.result.list[index].dt_txt;
    List _m = dt.split(' ');
    dt = _m[1];

    return SizedBox(
      width: 170,
      child: Center(
        child: Column(
          children: [
            Image.network("http://openweathermap.org/img/wn/${icon}@2x.png"),
            Text(dt),
            Text(d),
            Text(t.toString() + '°C')


          ],
        ),
      ),
    );
  }
}

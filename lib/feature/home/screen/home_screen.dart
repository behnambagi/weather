import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/init_value.dart';
import 'package:weather/feature/home/provider/home_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/feature/home/widgets/Detail_widget.dart';
import 'package:weather/feature/home/widgets/item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<HomeProvider>(context).weather;
    var byHour = Provider.of<HomeProvider>(context).byHour;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      "http://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png"),
                  Text(weather.weather[0].description)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(InitValue.myCity,
                      style: TextStyle(fontSize: 35, fontFamily: 'font')),
                  SvgPicture.asset('images/vector.svg')
                ],
              ),
              Text(
                weather.main.temp.toStringAsFixed(0) + "°C",
                style: TextStyle(fontSize: 85),
              ),
              Text(
                "شما احساس ميكنيد" +
                    "°C" +
                    weather.main.feelsLike.toStringAsFixed(0),
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 175,
                child: ListView.builder(
                  itemCount: byHour.result.list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemWidget(index: index);
                  },
                ),
              ),
              SizedBox(height: 3),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color(0xffCDC7C5)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GridView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return DetailWidget(index: index);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

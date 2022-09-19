library home;

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/feature/home/screen/home_screen.dart';
import 'package:weather_app/feature/home/widgets/navigation_bottom.dart';
part '../widgets/five_day_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> items= [
    const HomeScreen(),
    const Center(child: Text("whether")),
    const Center(child: Text("heart")),
    const Center(child: Text("profile")),
    // const LocationScreen(weather: false)
  ];

  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      NavigationBottomWidget(
        onChange: (v)=> {
          selectPage = v,
          setState((){})
        },
        selectIndex: selectPage,
      ),
      body: items[selectPage],
    );
  }
}

library home;

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weathera_app/feature/home/screen/home_screen.dart';
import 'package:weathera_app/feature/home/widgets/navigation_bottom.dart';
import 'package:weathera_app/feature/location/screen/location_screen.dart';
part '../widgets/five_day_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> items= [
    const HomeScreen(),
    const LocationScreen(weather: true,)
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

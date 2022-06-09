import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NavigationBottomWidget extends StatelessWidget {
  const NavigationBottomWidget({Key? key,required this.onChange,
    required this.selectIndex}) : super(key: key);

  final void Function(int) onChange;
  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: selectIndex,
        onTap: onChange,
        showSelectedLabels: false,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black38,
        items: const[
          BottomNavigationBarItem(
              label: "home",
              icon: Icon(Ionicons.home_outline)),
          BottomNavigationBarItem(
              label: "location",
              icon: Icon(Ionicons.location_outline)),
          BottomNavigationBarItem(
              label: "heart",
              icon: Icon(Ionicons.heart_outline)),
          BottomNavigationBarItem(
              label: "profile",
              icon: Icon(Ionicons.person_outline)),
        ]);
  }
}

import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData get basic => ThemeData(
    // fontFamily: Font.poppins,
    scaffoldBackgroundColor: Colors.white,
    primaryColorDark: const Color.fromRGBO(111, 88, 255, 1),
    primaryColor: Colors.white,
    primaryColorLight: const Color.fromRGBO(159, 84, 252, 1),
    brightness: Brightness.light,
    primarySwatch: Colors.green ,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(128, 109, 255, 1),
        ).merge(
          ButtonStyle(elevation: MaterialStateProperty.all(0)),
        )),
    canvasColor: Colors.white,
    cardColor: const Color.fromRGBO(38, 40, 55, 1),
  );

}
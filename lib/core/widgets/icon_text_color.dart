import 'dart:math';
import 'package:flutter/material.dart';

class IconTextColor extends StatelessWidget {
  const IconTextColor({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Center(child: Text(text[0], style: const TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold))),
    );
  }
}

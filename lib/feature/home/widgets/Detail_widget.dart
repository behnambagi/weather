import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({Key? key,
    required this.index, required this.value}) : super(key: key);
  final int index;
  final double? value;
  final List _list = ['سرعت باد', 'رطوبت', 'يو وي', 'فشار','درصد ديد', 'نقطه شبنم'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_list[index]+':'),
          Text(value?.toStringAsFixed(2)??"null"),
        ],
      )
    );
  }
}

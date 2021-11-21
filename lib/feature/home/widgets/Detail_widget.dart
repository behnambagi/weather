import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  final List _list = ['سرعت باد', 'رطوبت', 'يو وي', 'فشار','درصد ديد', 'نقطه شبنم'];

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<HomeProvider>(context);

    return Row(children: [

      Text(p.list[index].toString() +':'),
      Text(_list[index]),
    ],);
  }
}

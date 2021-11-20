import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  final List _list = ['wind Speed', 'Humidity', 'UV index', 'Pressure','Visibility', 'Dew point'];

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<HomeProvider>(context);

    return SizedBox(
      width: 60,
      height: 20,
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: _list[index] + ':',
              children: [TextSpan(text: p.list[index].toString())],
            ),
          ),
        ],
      ),
    );
  }
}

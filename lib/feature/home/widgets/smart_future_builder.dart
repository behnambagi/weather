import 'package:flutter/material.dart';

class SmartFutureBuilder<T> extends StatelessWidget {
  const SmartFutureBuilder({Key? key, required this.future, required this.widget}) : super(key: key);
  final Future<T> future;
  final Widget Function(dynamic) widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
        builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasError) return const CircularProgressIndicator(color: Colors.red);
        switch(snapshot.connectionState){
          case ConnectionState.done:
            if(T is List&&(T as List).isEmpty) return const Text("no data");
            if(snapshot.hasData) return widget(snapshot.data);
            break;
            default: return const CircularProgressIndicator();
        }
        return const CircularProgressIndicator();
    });
  }
}

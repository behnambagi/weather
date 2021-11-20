import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';

import 'init_value.dart';

class Init {

  Init._();

  static final instance = Init._();

  Future initialize(BuildContext context) async {
    InitValue.city();
    await Future.delayed(const Duration(seconds: 5));
  }
}
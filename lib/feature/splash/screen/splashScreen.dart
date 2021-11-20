import 'package:flutter/material.dart';
import 'package:weather/core/init_State.dart';
import 'package:weather/feature/home/screen/home_screen.dart';
import 'package:weather/feature/rules/screen/rules_screen.dart';
import 'package:weather/feature/splash/splash_state/splash_state.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateApp = SplashState.state;
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, snapShot) {
        if (snapShot.connectionState != ConnectionState.waiting) {
          if (stateApp) {
            return HomeScreen();
          } else {
            return RulesScreen();
          }
        } else {
          return Scaffold(
            backgroundColor: const Color(0xffe1f5fe),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud, size: 80),
                  CircularProgressIndicator()
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/utils.dart';
import '../../home/screen/home.dart';
import '../../rules/screen/rules_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<bool> initialize() async {
   var res = InitValue.myCity!=''?
   InitValue.myCity:await InitValue.getLocation();
   if(res==null) return false;
    await Future.delayed(const Duration(seconds: 2));
     return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: initialize(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          if (snapShot.data as bool) {
            return const Home();
          } else {
            return const RulesScreen();
          }
        } else {
          return Scaffold(
            backgroundColor: const Color(0xffe1f5fe),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.cloud, size: 80),
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

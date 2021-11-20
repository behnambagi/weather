import 'package:shared_preferences/shared_preferences.dart';

class SplashState {

  static bool state = false;

  static stateApp()async{
    var prefs =await SharedPreferences.getInstance();
   state =  prefs.getBool('state')!;
  }
}
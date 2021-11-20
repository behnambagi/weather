import 'package:shared_preferences/shared_preferences.dart';

class InitValue{

  InitValue.city(){
    getLocation();
  }

  static String myCity = '';

  void getLocation() async{
   try{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     myCity = prefs.getString('city')!;
   }catch(e){}

}

}
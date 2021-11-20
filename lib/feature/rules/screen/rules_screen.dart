import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateRule = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              Text('وضع هواي محلي', style: TextStyle(fontSize: 25)),
              Text('هر كجا كه هستيد', style: TextStyle(fontSize: 25)),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Text(
                  'با فعال كردن خدمات مكان ميتوانيد دقيق ترين پيشبيني را براي مكان خود دريافت كنيد.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 200),
              InkWell(
                onTap: () {
                  stateRule.stateChange(true).then((value) {
                    if (value) {
                      stateRule.setLocation();
                      stateRule.sendToApi().then((value) {
                        if (value) {
                          Navigator.pushNamed(context, '/home');
                        }
                      });
                    }
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'ضوابط و شرايط را ميپزيرم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

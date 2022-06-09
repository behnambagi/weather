import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              const Text('وضع هواي محلي', style: TextStyle(fontSize: 25)),
              const Text('هر كجا كه هستيد', style: TextStyle(fontSize: 25)),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: Text(
                  'با فعال كردن خدمات مكان ميتوانيد دقيق ترين پيشبيني را براي مكان خود دريافت كنيد.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 200),
              InkWell(
                onTap: ()  async{
                  var res = await homeProvider.sendToApi();
                  if(res) Navigator.pushNamed(context, '/');

                },
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
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



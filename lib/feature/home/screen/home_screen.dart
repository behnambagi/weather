import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;
import '../../../core/enums/enums.dart';
import '../../../core/images/image_widget.dart';
import '../../../core/images/images.dart';
import '../../location/screen/location_screen.dart';
import '../provider/home_provider.dart';
import '../widgets/smart_future_builder.dart';
import '../widgets/text_gradient.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    var provider = Provider.of<HomeProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: SmartFutureBuilder(
          future: provider.futureInitHome,
          widget: (v) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                height: s.height-60,
                child: Stack(
                  children: [
                    PositionedDirectional(
                        width: s.width,
                        top: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageBlur(ImageAsset(
                                provider.weather.weatherIcon??"",
                                asset: AssetEnum.weatherIcon),
                                type: TypeFileEnum.png, height: 290),
                          ],
                        )) ,
                    Container(
                      alignment: AlignmentDirectional.topEnd,
                      margin: const EdgeInsetsDirectional.only(end: 40, top: 20),
                      child: Row(
                        children: [
                          SizedBox(width: s.width*0.088),
                          const Icon(Icons.location_on_outlined),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(intl.DateFormat.yMMMd().format(DateTime.now()),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.grey.shade500)),
                              Row(
                                children: [
                                  IconButton(
                                      icon: const Icon(Icons.edit, size: 20),
                                      onPressed: ()async{
                                       var res = await Navigator.of(context).push(
                                            MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const LocationScreen(weather: true);
                                          }));
                                       if(res==null) return;
                                       provider.findOfLatLong(res);
                                      }),
                                  Text(provider.weather.areaName??"Tehran", style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 48),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Positioned.directional(
                      end: 0,
                      bottom: 0,
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: const EdgeInsetsDirectional.only(end: 50),
                        alignment: AlignmentDirectional.topEnd,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GradientText(
                              "${provider.weather.temperature?.celsius?.round()}°",
                              style: const TextStyle(
                                  fontSize: 135, fontWeight: FontWeight.bold),
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black45,
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter),
                            ),
                            const SizedBox(height: 20),
                            Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text(
                                  provider.weather.weatherMain ?? "",
                                  style: const TextStyle(
                                      color: Color(0xffFF8E27),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

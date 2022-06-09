import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:weathera_app/core/widgets/search_field.dart';
import 'package:weathera_app/feature/location/provider/location_selector_provider.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key, bool? weather})
      :isWeather = weather??false, super(key: key);
  final bool isWeather;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocationSelectorProvider>(context);
    print(isWeather);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: 'unq1',
                backgroundColor: Colors.white,
                child: const Icon(Icons.my_location, color: Colors.green),
                onPressed: ()=>provider.gpsLocation()
              ),
             if(isWeather) ...[
                const SizedBox(height: 15),
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: ()=> Navigator.pop(context, provider.latLong),
                  child: Material(
                    elevation: 5,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(22),
                    child: const Padding(
                        padding: EdgeInsets.all(17),
                        child: Icon(Icons.done, color: Colors.white)),
                  ),
                )]
            ],
          ),
          body: FlutterMap(
            options: MapOptions(
              center: provider.latLong,
              onTap: (position, latLong){
                provider.latLong = latLong;
                provider.listen();
              }, zoom: 13.0,
            ),
            children: [
              TileLayerWidget(options: TileLayerOptions(
                  attributionBuilder: (_) {
                    return const Text("© OpenStreetMap contributors");
                  },

                  urlTemplate:
                  isWeather?
                  "https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?basemap=map&cities=false&layer=temperature&appid=f5930c6e7ae40e126b7a409358c5097e"
                      : "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/"
                      "{z}/{x}/{y}?access_token=pk.eyJ1IjoiYmVobmFtYmFnaSIsImEiOiJjbDQ2bm5ia3AwMDh5M2JvYjdnbjh5dmhpIn0.o6p8RCINGdKExi6bGfzU_Q",
              )),
              MarkerLayerWidget(options: MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 85.0,
                    point: provider.latLong,
                    builder: (ctx) => Column(
                      children: [
                        Icon(Icons.location_on, color: Colors.red.shade600, size: 45,
                            shadows: const[Shadow(color: Colors.red, blurRadius: 1)]),
                      ],
                    ),
                  ),
                ],
              )),
               Align(
                alignment: Alignment.topCenter,
                child: SearchWidget(isBack: isWeather,)
              )
            ],
          )),
    );
  }


}

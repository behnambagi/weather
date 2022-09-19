import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/location/provider/location_provider.dart';
import '../../../core/widgets/search_widget.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, bool? weather})
      : isWeather = weather ?? false,
        super(key: key);
  final bool isWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocationProvider>(context);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                  heroTag: 'unq1',
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.my_location, color: Colors.green),
                  onPressed: () => provider.gpsLocation(mapController)),
              if (widget.isWeather) ...[
                const SizedBox(height: 15),
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () => Navigator.pop(context, provider.latLong),
                  child: Material(
                    elevation: 5,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(22),
                    child: const Padding(
                        padding: EdgeInsets.all(17),
                        child: Icon(Icons.done, color: Colors.white)),
                  ),
                )
              ]
            ],
          ),
          body: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: provider.latLong,
              onTap: (position, latLong) {
                provider.latLong = latLong;
                provider.listen();
              },
              zoom: 13.0,
            ),
            children: [
              TileLayerWidget(
                  options: TileLayerOptions(
                attributionBuilder: (_) {
                  return const Text("© OpenStreetMap contributors");
                },
                urlTemplate: !widget.isWeather
                    ? "https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?basemap=map&cities=false&layer=temperature&appid=f5930c6e7ae40e126b7a409358c5097e"
                    : "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/"
                        "{z}/{x}/{y}?access_token=pk.eyJ1IjoiYmVobmFtYmFnaSIsImEiOiJjbDQ2bm5ia3AwMDh5M2JvYjdnbjh5dmhpIn0.o6p8RCINGdKExi6bGfzU_Q",
              )),
              MarkerLayerWidget(
                  options: MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 85.0,
                    point: provider.latLong,
                    builder: (ctx) => Column(
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.red.shade600,
                            size: 45,
                            shadows: const [
                              Shadow(color: Colors.red, blurRadius: 1)
                            ]),
                      ],
                    ),
                  ),
                ],
              )),
              Align(
                  alignment: Alignment.topCenter,
                  child: SearchWidget(
                    isBack: widget.isWeather,
                    onClick: (LatLng latLng) => {
                      provider.latLong = latLng,
                      provider.listen(),
                      mapController.move(latLng, 13.2)
                    },
                  ))
            ],
          )),
    );
  }

}

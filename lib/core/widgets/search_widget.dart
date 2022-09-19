import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/widgets/search_field.dart';
import '../../feature/location/provider/location_provider.dart';
import 'icon_text_color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.isBack,
    required this.onClick, this.controller}) : super(key: key);
  final bool isBack;
  final TextEditingController? controller;
  final Function(LatLng) onClick;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocationProvider>(context);

    return Column(
      children: [
        SearchFieldCustom(
          controller: controller,
            onSearch: (v)async=>
        provider.listResult = await provider.searchCity(v),
            isBack: isBack),
        AnimatedContainer(
          height: provider.listResult.length*75,
          curve: Curves.easeOut,
          constraints: const BoxConstraints(maxHeight: 275),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for(var i in provider.listResult)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ListTile(
                      title: Text(i.text),
                      subtitle: Text(i.placeName),
                      leading: IconTextColor(text: i.text),
                      onTap: ()=> {onClick(i.latLng),
                        provider.listResult.clear()},
                    ),
                  ),
              ],
            ),
          ),)
      ],
    );
  }
}
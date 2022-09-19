import 'package:flutter/material.dart';
import 'package:weather_app/core/debounce.dart';
import 'package:weather_app/core/widgets/text_field_custom.dart';
import 'icon_text_color.dart';

class SearchFieldCustom extends StatelessWidget {
  SearchFieldCustom({Key? key,required this.onSearch,
    required this.isBack, this.controller}) : super(key: key);

  final void Function(String) onSearch;
  final bool isBack;
  final TextEditingController? controller;

  final debounce = Debounce(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 20, bottom: 5),
      child: TextFieldCustom(
        elevation: 3,
        controller: controller,
        prefixIcon: isBack?const BackButton():null,
        suffixIcon: const Icon(Icons.search, color: Colors.green),
        textInputAction: TextInputAction.search,
        onChanged: (v)=>debounce.run(() =>onSearch(v)),
      ),
    );
  }
}


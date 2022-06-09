import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weathera_app/core/debounce.dart';
import 'package:weathera_app/core/widgets/text_field_custom.dart';

class SearchFieldCustom extends StatelessWidget {
  SearchFieldCustom({Key? key,required this.onSearch, required this.isBack}) : super(key: key);
  final void Function(String) onSearch;
  final bool isBack;

  final debounce = Debounce(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 20, bottom: 5),
      child: TextFieldCustom(
        elevation: 3,
        prefixIcon: isBack?const BackButton():null,
        suffixIcon: const Icon(Icons.search, color: Colors.green),
        textInputAction: TextInputAction.search,
        onChanged: (v)=>debounce.run(() =>onSearch(v)),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.isBack}) : super(key: key);
  final bool isBack;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final List<String> list =["tehran", "iran", "sonqor", "kerman"];

   List<String> filter =[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFieldCustom(onSearch: (v)=> {
          filter = list.where((e) => e.contains(v)).toList(),
          setState((){})
        }, isBack: widget.isBack),
        AnimatedContainer(
          height: filter.length*55,
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
              for(var i in filter)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: ListTile(title: Text(i),leading: IconTextColor(text: i)),
                ),
            ],
          ),
        ),)
      ],
    );
  }
}

class IconTextColor extends StatelessWidget {
  const IconTextColor({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Center(child: Text(text[0], style: const TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold))),
    );
  }
}

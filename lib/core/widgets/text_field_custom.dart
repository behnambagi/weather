import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({Key? key, this.onChanged, this.textInputAction,
    this.onFieldSubmitted, this.border, this.suffixIcon,
    this.prefixIcon, this.elevation, this.controller}) : super(key: key);
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final InputBorder? border;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? elevation;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: elevation??0,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
    child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: "Search here",
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45,width: .3),
              borderRadius: BorderRadius.all(Radius.circular(25))),

          border: border??const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(25))),

        ),
      ),
    );
  }
}

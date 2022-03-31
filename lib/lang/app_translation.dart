import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslationWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const AppTranslationWidget({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.tr, style: style);
  }
}

class AppTranslationString {
  AppTranslationString._();

  static String string(String data) => data.tr;
}

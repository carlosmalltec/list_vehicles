import 'package:flutter/material.dart';

class ConstColors {
  ConstColors._();

  //GLOBAL
  static const Color orange = Color(0xFFFA775D);
  static const Color blue = Color(0xFF0C2D59);
  static const Color fillColor = Color(0xFF263545);
  static const Color greenDark = Color(0xFF039B6A);
  static const Color background = Color(0xFFdedede);

  //CORES PARA CAMPOS DO FORMULÁRIO
  static const Color border = Color(0xFFB6B9D0);
  static const Color placeholder = border;
  static const Color danger = Color(0xFFD5543A);
  static const Color colorText = Color(0xFF312F4F);
  static const Color white = Color(0xFFFFFFFF);

  static MaterialColor primarySwatch = createMaterialColor(blue);

  static MaterialColor createMaterialColor(Color color) {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}

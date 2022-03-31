import '/core/responsive/orientation_layout.dart';
import '/core/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'pages/splash_phone.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => const SplashPhone(),
        landscape: (context) => const SplashPhone(),
      ),
      tablet: const SplashPhone(),
      desktop: const SplashPhone(),
    );
  }
}

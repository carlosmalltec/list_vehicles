import 'package:appvehicles/core/responsive/orientation_layout.dart';
import 'package:appvehicles/core/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';

import 'pages/vehicle_phone.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => const VehiclePhone(),
        landscape: (context) => const VehiclePhone(),
      ),
      tablet: const VehiclePhone(),
      desktop: const VehiclePhone(),
    );
  }
}

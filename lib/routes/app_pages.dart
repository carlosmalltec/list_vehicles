

import 'package:appvehicles/modules/home/bindings/vehicle_bindings.dart';
import 'package:appvehicles/modules/home/presenter/vehicle_screen.dart';
import 'package:appvehicles/modules/splash/bindings/splash_bindings.dart';
import 'package:appvehicles/modules/splash/presenter/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => const SplashScreen(), binding: SplashBindings()),
    GetPage(name: Routes.PAGE_HOME, page: () => const VehicleScreen(), binding: VehicleBindings()),
  ];
}

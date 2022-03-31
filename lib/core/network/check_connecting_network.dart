import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckConnectingNetwork extends GetxController {
  Future<bool> appCheckConnectivity() async {
    bool isDeviceConnected = false;
    var _conn = await (Connectivity().checkConnectivity());
    if (_conn != ConnectivityResult.none) {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
    }
    return isDeviceConnected;
  }
}

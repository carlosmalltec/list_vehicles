import 'package:appvehicles/core/network/check_connecting_network.dart';

import '/core/network/network.dart';
import '/modules/home/external/datasource/vehicle_datasource_impl.dart';
import '/modules/home/presenter/controller/vehicle_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class VehicleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(CheckConnectingNetwork());
    Get.put(Network(Get.find<Dio>()));
    Get.put(VehicleDatasourceImpl(Get.find<Network>()));
    Get.put(VehicleController(
      request: Get.find<VehicleDatasourceImpl>(),
      connectivityStore: Get.find<CheckConnectingNetwork>(),
    ));
  }
}

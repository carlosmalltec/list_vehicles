import '/core/network/network.dart';
import '/modules/home/external/datasource/vehicle_datasource_impl.dart';
import '/modules/home/presenter/controller/vehicle_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(Network(Get.find<Dio>()));
    Get.put(VehicleDatasourceImpl(Get.find<Network>()));
    Get.put(VehicleController(request: Get.find<VehicleDatasourceImpl>()));
  }
}

import 'package:appvehicles/constants/application_url.dart';
import 'package:appvehicles/constants/const_endpoint.dart';
import 'package:appvehicles/core/network/network.dart';
import 'package:appvehicles/modules/home/infra/datasources/vehicle_datasource.dart';
import 'package:appvehicles/modules/home/infra/models/network/response_vehicle_impl.dart';

class VehicleDatasourceImpl implements VehicleDatasource {
  final Network _network;
  VehicleDatasourceImpl(this._network);

  @override
  Future<ResponseVehicleImpl> vehiclesDatasource(int page) async {
    try {
      final response = await _network.get(ApplicationUrl.findAllVehicles(page));
      if (response.statusCode == null) return ResponseVehicleImpl.fromMap(statusCode: STATUS_CODE_DEFAULT, data: null, statusMessage: STATUS_MESSAGE_DEFAULT);
      var _statusMessage = response.statusMessage ?? STATUS_MESSAGE_DEFAULT;
      var _statusCode = response.statusCode ?? STATUS_CODE_DEFAULT;
      return ResponseVehicleImpl.fromMap(statusCode: _statusCode, data: response.data, statusMessage: _statusMessage);
    } catch (e) {
      return ResponseVehicleImpl.fromMap(statusCode: STATUS_CODE_DEFAULT, data: null, statusMessage: e.toString());
    }
  }
}

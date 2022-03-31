
import 'package:appvehicles/modules/home/infra/models/network/response_vehicle_impl.dart';

abstract class VehicleDatasource {
  Future<ResponseVehicleImpl> vehiclesDatasource(int page);
}

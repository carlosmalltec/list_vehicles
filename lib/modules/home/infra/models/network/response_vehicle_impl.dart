import 'package:appvehicles/modules/home/domain/entities/network/response_vehicle.dart';
import 'package:appvehicles/modules/home/infra/models/vehicle_impl.dart';

class ResponseVehicleImpl extends ResponseVehicle {
  final List<VehicleImpl>? model;
  final int? statusCode;
  final String? statusMessage;

  const ResponseVehicleImpl({this.statusCode, this.statusMessage, required this.model});

  factory ResponseVehicleImpl.fromMap({List<dynamic>? data, int? statusCode, String? statusMessage}) {
    return ResponseVehicleImpl(
      model: data?.map<VehicleImpl>((data) => VehicleImpl.fromMap(data)).toList() ?? [],
      statusCode: statusCode,
      statusMessage: statusMessage,
    );
  }
}

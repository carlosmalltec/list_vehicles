import '/core/failures/failures.dart';
import '/modules/home/domain/entities/network/response_vehicle.dart';
import 'package:dartz/dartz.dart';

abstract class VehicleRepository {
  Future<Either<Failures, ResponseVehicle>> findVehicleRepository(int page);
}

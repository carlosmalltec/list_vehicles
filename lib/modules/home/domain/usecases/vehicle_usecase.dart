import '/core/failures/failures.dart';
import '/modules/home/domain/entities/network/response_vehicle.dart';

import 'package:dartz/dartz.dart';

abstract class VehicleUsecase {
  Future<Either<Failures, ResponseVehicle>> findByVehicle(int page);
}
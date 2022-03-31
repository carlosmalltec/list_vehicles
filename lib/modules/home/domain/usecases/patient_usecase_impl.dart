import 'package:appvehicles/core/failures/failure_generic.dart';
import 'package:appvehicles/modules/home/domain/entities/network/response_vehicle.dart';
import 'package:appvehicles/core/failures/failures.dart';
import 'package:appvehicles/modules/home/domain/repositories/vehicle_repository.dart';
import 'package:dartz/dartz.dart';

import 'vehicle_usecase.dart';

class VehicleUsecaseImpl implements VehicleUsecase {
  final VehicleRepository repository;

  VehicleUsecaseImpl(this.repository);

  @override
  Future<Either<Failures, ResponseVehicle>> findByVehicle(int page) async {
    try {
      return repository.findVehicleRepository(page);
    } catch (e) {
      return left(FailureGeneric(message: 'Paramêtros obrigatórios'));
    }
  }
}

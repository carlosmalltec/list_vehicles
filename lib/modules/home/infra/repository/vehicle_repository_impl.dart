import 'package:appvehicles/core/failures/datasource_error.dart';
import 'package:appvehicles/modules/home/domain/entities/network/response_vehicle.dart';
import 'package:appvehicles/core/failures/failures.dart';
import 'package:appvehicles/modules/home/domain/repositories/vehicle_repository.dart';
import 'package:appvehicles/modules/home/infra/datasources/vehicle_datasource.dart';
import 'package:dartz/dartz.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleDatasource datasource;

  VehicleRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, ResponseVehicle>> findVehicleRepository(int page)async {
    try {
      final result = await datasource.vehiclesDatasource(page);
      return right(result);
    } on DatasourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DatasourceError(message: 'Não foi possível solicitar os dados para o servidor'));
    }
  }
}

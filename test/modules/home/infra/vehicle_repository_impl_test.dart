import 'package:appvehicles/core/failures/datasource_error.dart';
import 'package:appvehicles/modules/home/infra/datasources/vehicle_datasource.dart';
import 'package:appvehicles/modules/home/infra/models/network/response_vehicle_impl.dart';
import 'package:appvehicles/modules/home/infra/repository/vehicle_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class VehicleDatasourceMock extends Mock implements VehicleDatasource {}

main() {
  final datasource = VehicleDatasourceMock();
  final repository = VehicleRepositoryImpl(datasource);

  group('Teste de sucesso do repositório: ', () {
    test('Deve retornar ResponseVehicleImpl como sucesso', () async {
      when(() => datasource.vehiclesDatasource(1)).thenAnswer((_) async => const ResponseVehicleImpl(model: null, statusCode: 000, statusMessage: 'sucesso'));
      final _result = await repository.findVehicleRepository(1);
      expect(_result.fold(id, id), isA<ResponseVehicleImpl>());
    });
  });

  group('Teste de falha do repositório: ', () {
    test('Deve retornar DatasourceError em caso de flaha', () async {
      when(() => datasource.vehiclesDatasource(0)).thenThrow(Exception());
      final _result = await repository.findVehicleRepository(0);
      expect(_result.fold(id, id), isA<DatasourceError>());
    });
  });
}

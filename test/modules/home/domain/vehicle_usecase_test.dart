import 'package:appvehicles/core/failures/failure_generic.dart';
import 'package:appvehicles/modules/home/domain/entities/network/response_vehicle.dart';
import 'package:appvehicles/modules/home/domain/repositories/vehicle_repository.dart';
import 'package:appvehicles/modules/home/domain/usecases/vehicle_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class VehicleRepositoryMock extends Mock implements VehicleRepository {}

main() {
  final repositoryMock = VehicleRepositoryMock();
  final usecases = VehicleUsecaseImpl(repositoryMock);

  group('Fluxo de teste com sucesso', () {
    test('Deve retornar ResponseVehicle como sucesso', () async {
      when(() => repositoryMock.findVehicleRepository(1)).thenAnswer((_) async => right(const ResponseVehicle()));
      final _result = await usecases.findByVehicle(1);
      expect(_result.fold(id, id), isA<ResponseVehicle>());
    });
  });

  group('Fluxo de teste de falha: ', () {
    test('Deve retorar FailureGeneric', () async {
      when(() => repositoryMock.findVehicleRepository(0)).thenAnswer((_) async => left(FailureGeneric(message: 'Falha')));
      final _result = await usecases.findByVehicle(0);
      expect(_result.fold(id, id), isA<FailureGeneric>());
    });
  });
}

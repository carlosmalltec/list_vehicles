import 'package:appvehicles/constants/const_endpoint.dart';
import 'package:appvehicles/core/network/network.dart';
import 'package:appvehicles/modules/home/external/datasource/vehicle_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NetworkMock extends Mock implements Network {}

main() {

  final _network = NetworkMock();
  final datasource = VehicleDatasourceImpl(_network);

  group('Teste de sucesso: ', () {
    final tResponse = Response(statusCode: 200, data: {"data": null, "message": "OK", "statusCode": 200}, requestOptions: RequestOptions(path: ENDPOINT));
    test('Deve retornar 200 em caso de sucesso', () async {
      when(() => _network.get('router-test')).thenAnswer((_) async => tResponse);
      final result = datasource.vehiclesDatasource(1);
      expect(result, completes);
    });
  });
}
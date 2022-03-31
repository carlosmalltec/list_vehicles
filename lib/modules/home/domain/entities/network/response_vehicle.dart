import 'package:equatable/equatable.dart';

import '../vehicle.dart';

class ResponseVehicle extends Equatable {
  final List<Vehicle>? model;
  final int? statusCode;
  final String? statusMessage;

  const ResponseVehicle({this.statusCode, this.statusMessage, this.model});

  @override
  List<Object?> get props => [statusCode, statusMessage, model];
}

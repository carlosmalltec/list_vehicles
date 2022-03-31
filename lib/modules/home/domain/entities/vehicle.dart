import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String? make;
  final String? model;
  final String? version;
  final String? image;
  final String? price;
  final String? color;
  final int? id;
  final int? km;
  final int? yearModel;
  final int? yearFab;

  const Vehicle({
    this.id,
    this.make,
    this.model,
    this.version,
    this.image,
    this.km,
    this.price,
    this.yearModel,
    this.yearFab,
    this.color,
  });

  @override
  List<Object?> get props => [
        id,
        make,
        model,
        version,
        image,
        km,
        price,
        yearModel,
        yearFab,
        color,
      ];
}

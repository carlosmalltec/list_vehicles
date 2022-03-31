import 'dart:convert';
import 'package:appvehicles/modules/home/domain/entities/vehicle.dart';

VehicleImpl vehicleImplFromMap(String str) => VehicleImpl.fromMap(json.decode(str));

String vehicleImplToMap(VehicleImpl data) => json.encode(data.toMap());

class VehicleImpl extends Vehicle {
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

  const VehicleImpl({
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

  VehicleImpl copyWith({
    String? make,
    String? model,
    String? version,
    String? image,
    String? price,
    String? color,
    int? id,
    int? km,
    int? yearModel,
    int? yearFab,
  }) =>
      VehicleImpl(
        id: id ?? this.id,
        make: make ?? this.make,
        model: model ?? this.model,
        version: version ?? this.version,
        image: image ?? this.image,
        km: km ?? this.km,
        price: price ?? this.price,
        yearModel: yearModel ?? this.yearModel,
        yearFab: yearFab ?? this.yearFab,
        color: color ?? this.color,
      );

  factory VehicleImpl.fromMap(Map<String, dynamic> json) => VehicleImpl(
        id: json["ID"],
        make: json["Make"],
        model: json["Model"],
        version: json["Version"],
        image: json["Image"],
        km: json["KM"],
        price: json["Price"],
        yearModel: json["YearModel"],
        yearFab: json["YearFab"],
        color: json["Color"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "Make": make,
        "Model": model,
        "Version": version,
        "Image": image,
        "KM": km,
        "Price": price,
        "YearModel": yearModel,
        "YearFab": yearFab,
        "Color": color,
      };
}

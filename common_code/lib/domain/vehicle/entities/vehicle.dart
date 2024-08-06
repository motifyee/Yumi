// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

enum VehicleType { _, car, motorcycle, bicycle, other }

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    String? code,
    @JsonKey(name: 'vehicle_Type') required int typeCode,
    @JsonKey(name: 'other_Type') String? otherType,
  }) = _Vehicle;

  const Vehicle._();

  VehicleType typeOfCode(int typeCode) {
    return VehicleType.values.firstWhere(
      (e) => e.index == typeCode,
      orElse: () => VehicleType._,
    );
  }

  VehicleType get vehicleType => typeOfCode(typeCode);

  String? vehicleName() {
    if (vehicleType == VehicleType.other) return otherType;
    if (vehicleType == VehicleType._) return null;

    return vehicleType.name;
  }

  Vehicle copyWithVehicleType(String type) {
    int code = (VehicleType.values
        .firstWhere((e) => e.name == type.toLowerCase(),
            orElse: () => VehicleType.other)
        .index);

    var other = code == VehicleType.other.index ? type : '';

    return copyWith(
      typeCode: code,
      otherType: other,
    );
  }

  // String get fullAddress => "${street ?? ''}, ${city ?? ''}, ${country ?? ''}";

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);
}

import 'package:yumi/domain/vehicle/entities/vehicle.dart';

abstract class VehicleSrc {
  Future<Vehicle> getVehicle();
  Future<String> addVehicle(Vehicle vehicle);
  Future<String> updateVehicle(Vehicle vehicle);
}

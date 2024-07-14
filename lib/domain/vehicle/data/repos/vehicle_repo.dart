import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';

abstract class VehicleRepo {
  TaskEither<Failure, Vehicle> getVehicle();
  TaskEither<Failure, String> addVehicle(Vehicle vehicle);
  TaskEither<Failure, String> updateVehicle(Vehicle vehicle);
}

import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/exceptions.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:common_code/domain/vehicle/data/sources/vehicle_src.dart';
import 'package:common_code/domain/vehicle/entities/vehicle.dart';

class VehicleRemoteRepo implements VehicleRepo {
  VehicleSrc src;
  VehicleRemoteRepo({VehicleSrc? src}) : src = src ?? getIt<VehicleSrc>();

  @override
  TaskEither<Failure, String> addVehicle(Vehicle vehicle) {
    return TaskEither.tryCatch(
      () => src.addVehicle(vehicle),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }

  @override
  TaskEither<Failure, Vehicle> getVehicle() {
    return TaskEither.tryCatch(
      () => src.getVehicle(),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }

  @override
  TaskEither<Failure, String> updateVehicle(Vehicle vehicle, String userId) {
    return TaskEither.tryCatch(
      () => src.updateVehicle(vehicle, userId),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }
}

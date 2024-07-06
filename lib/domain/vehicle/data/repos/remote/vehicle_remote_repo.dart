import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:yumi/domain/vehicle/data/sources/vehicle_src.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';

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
  TaskEither<Failure, String> updateVehicle(Vehicle vehicle) {
    return TaskEither.tryCatch(
      () => src.updateVehicle(vehicle),
      (error, stackTrace) => Failure.fromException(error as CException),
    );
  }
}

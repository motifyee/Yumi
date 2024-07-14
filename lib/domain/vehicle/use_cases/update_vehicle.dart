import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';

class UpdateVehicle extends UseCase<String, UpdateVehicleParams> {
  final VehicleRepo repo;

  UpdateVehicle({VehicleRepo? transactionRepo})
      : repo = transactionRepo ?? getIt<VehicleRepo>();

  @override
  Future<Either<Failure, String>> call(UpdateVehicleParams params) =>
      repo.updateVehicle(params.vehicle).run();
}

class UpdateVehicleParams extends Params {
  final Vehicle vehicle;

  UpdateVehicleParams({required this.vehicle});

  @override
  List<Object?> get props => [vehicle];
}

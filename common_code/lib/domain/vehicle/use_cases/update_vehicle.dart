import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:common_code/domain/vehicle/entities/vehicle.dart';

class UpdateVehicle extends UseCase<String, UpdateVehicleParams> {
  final VehicleRepo repo;

  UpdateVehicle({VehicleRepo? transactionRepo})
      : repo = transactionRepo ?? getIt<VehicleRepo>();

  @override
  Future<Either<Failure, String>> call(UpdateVehicleParams params) =>
      repo.updateVehicle(params.vehicle, params.userId).run();
}

class UpdateVehicleParams extends Params {
  final Vehicle vehicle;
  final String userId; // G().rd<UserCubit>().state.user.id

  UpdateVehicleParams({required this.vehicle, required this.userId});

  @override
  List<Object?> get props => [vehicle, userId];
}

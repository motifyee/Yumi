import 'package:dio/dio.dart';
import 'package:yumi/app/pages/settings/bankinfo/bankinfo_service.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';
import 'package:yumi/domain/vehicle/data/sources/vehicle_src.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/api_statics.dart';

class VehicleRemoteSrc implements VehicleSrc {
  @override
  Future<String> addVehicle(Vehicle vehicle) async {
    var v = vehicle.copyWith(code: getRandomString(15)).toJson();

    try {
      final Response res = await DioClient.simpleDio().post(
        '/drivers/vehicle',
        data: v,
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<Vehicle> getVehicle() async {
    try {
      final Response res = await DioClient.get(
        '/drivers/vehicle',
      );

      return Vehicle.fromJson(res.data);
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<String> updateVehicle(Vehicle vehicle) async {
    String id = G.rd<UserCubit>().state.user.id;
    var v = vehicle.toJson();

    v.remove('code');
    if (v['Other_Type'] == null) v['Other_Type'] = '';

    try {
      final Response res = await DioClient.simpleDio().put(
        '/drivers/vehicle/$id',
        data: vehicle.toJson(),
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}

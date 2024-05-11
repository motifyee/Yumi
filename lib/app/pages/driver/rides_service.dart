import 'package:dio/dio.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/app/pages/driver/model/vehicle.dart';
import 'package:yumi/app/pages/settings/bankinfo/bankinfo_service.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/api_statics.dart';

class VehicleService {
  static Future<Vehicle?> getVehicle() async {
    try {
      final Response res = await DioClient.simpleDio().get(
        '/drivers/vehicle',
      );
      return Vehicle.fromJson(res.data);
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> addVehicle(Vehicle vehicle) async {
    // String id = G.read<UserBloc>().state.user.id;
    var v = vehicle
        .copyWith(
          code: getRandomString(15),
        )
        .toJson();

    // if (v['Other_Type'] == null) {
    //   v['Other_Type'] = '';
    // }

    final Response res = await DioClient.simpleDio().post(
      '/drivers/vehicle',
      data: v,
    );

    return res;
  }

  static Future<dynamic> updateVehicle(Vehicle vehicle) async {
    String id = G.read<UserBloc>().state.user.id;
    var v = vehicle.toJson();
    // code: getRandomString(15),

    v.remove('code');
    if (v['Other_Type'] == null) {
      v['Other_Type'] = '';
    }

    final Response res = await DioClient.simpleDio().put(
      '/drivers/vehicle/$id',
      data: vehicle.toJson(),
    );

    return res;
  }
}

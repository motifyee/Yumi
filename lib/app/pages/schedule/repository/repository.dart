
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/schedule/model/model.dart';
import 'package:yumi/app/pages/schedule/repository/interface.dart';
import 'package:yumi/statics/api_statics.dart';

class ScheduleRepo implements IScheduleRepo {
  @override
  Future<Schedule> getMySchedule(BuildContext? ctx) async {
    final Response res = await DioClient.simpleDio(ctx!).get(
      '/accounts/schedule',
    );

    var data = <String, dynamic>{};

    if (res.data.toString().isNotEmpty) data = res.data;

    var fromJson = Schedule.fromJson(data);
    return fromJson;
  }

  @override
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule) async {
    var data = schedule.toJson();

    data.remove('id');
    data.remove('userID');

    List<String> keys = [];
    data.forEach(
      (k, v) {
        if (v == null) keys.add(k);
      },
    );
    for (var element in keys) {
      data.remove(element);
    }

    final Response res = await DioClient.simpleDio(ctx!).put(
      '/accounts/schedule',
      data: data,
    );

    return res.data.toString();
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/entity/schedule.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/repository/interface.dart';
import 'package:common_code/common_code.dart';

class ScheduleRepo implements IScheduleRepo {
  @override
  Future<Schedule> getMySchedule(BuildContext? ctx) async {
    final Response res = await APIClient().get(
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

    final Response res = await APIClient().put(
      '/accounts/schedule',
      data: data,
    );

    return res.data.toString();
  }
}

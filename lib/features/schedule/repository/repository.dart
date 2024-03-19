import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:yumi/features/schedule/repository/interface.dart';
import 'package:yumi/statics/api_statics.dart';

class ScheduleRepo implements IScheduleRepo {
  @override
  Future<Schedule> getMySchedule(BuildContext? ctx) async {
    final Response res = await DioClient.simpleDio(ctx!).get(
      '/accounts/schedule',
    );

    var data = <String, dynamic>{};

    if (res.data.toString().isNotEmpty) data = res.data;

    return Schedule.fromJson(data);
  }

  @override
  Future<String> saveMySchedule(BuildContext? ctx, Schedule schedule) async {
    final Response res = await DioClient.simpleDio(ctx!).put(
      '/accounts/schedule',
      data: schedule.toJson(),
    );

    return res.data.toString();
  }
}

import 'package:dio/dio.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/schedule/data/sources/schedule_sources.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';
import 'package:yumi/statics/api_statics.dart';

class ScheduleRemoteSrc implements ScheduleSrc {
  final Dio client;

  ScheduleRemoteSrc({Dio? client}) : client = client ?? DioClient.dio;

  @override
  Future<Schedule> getMySchedule() async {
    final Response res = await DioClient.get(
      '/accounts/schedule',
    );

    if (res.statusCode != 200 && res.statusCode != 201) throw ServerException();

    var data = <String, dynamic>{};

    if (res.data.toString().isNotEmpty) data = res.data;

    var fromJson = Schedule.fromJson(data);
    return fromJson;
  }

  @override
  Future<String> saveMySchedule(Schedule schedule) async {
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

    // -------------------------------------------------------------------------

    final Response res = await DioClient.simpleDio().put(
      '/accounts/schedule',
      data: data,
    );

    if (res.statusCode != 200) throw ServerException();

    return res.data.toString();
  }
}

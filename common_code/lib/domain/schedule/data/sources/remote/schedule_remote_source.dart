import 'package:dio/dio.dart';
import 'package:common_code/domain/schedule/data/sources/schedule_sources.dart';
import 'package:common_code/domain/schedule/entities/schedule.dart';
import 'package:common_code/common_code.dart';

class ScheduleRemoteSrc implements ScheduleSrc {
  final APIClient client;

  ScheduleRemoteSrc({APIClient? client}) : client = client ?? APIClient();

  @override
  Future<Schedule> getMySchedule() async {
    final Response res = await client.get(
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

    final Response res = await client.put(
      '/accounts/schedule',
      data: data,
    );

    if (res.statusCode != 200) throw ServerException();

    return res.data.toString();
  }
}

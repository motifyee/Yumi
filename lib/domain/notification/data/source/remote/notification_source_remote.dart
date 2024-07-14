import 'package:dio/dio.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:common_code/common_code.dart';

class NotificationSourceRemote implements NotificationSource {
  @override
  Future<PaginatedData<NotificationS>> loadNotifications(
      {required PaginatedData<NotificationS> pagination}) async {
    Response res = await APIClient()
        .get(EndPoints.notifications, queryParameters: pagination.toJson());

    List<NotificationS> notification = res.data['data']
        .map<NotificationS>((json) => NotificationS.fromJson(json))
        .toList();

    return pagination.copyWith(
      data: [...pagination.data as List<NotificationS>, ...notification]
          .unique((e) => e.id),
      isLoading: false,
      total: res.data['pagination']['total'],
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginatedData<NotificationS>;
  }
}

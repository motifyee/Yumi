import 'package:dio/dio.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination_helper.dart';

class NotificationSourceRemote implements NotificationSource {
  @override
  Future<PaginationHelper<Notification>> loadNotifications(
      {required PaginationHelper<Notification> pagination}) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.notifications, queryParameters: pagination.toJson());

    List<Notification> notification = res.data['data']
        .map<Notification>((json) => Notification.fromJson(json))
        .toList();

    return pagination.copyWith(
      data: [...pagination.data, ...notification].unique((e) => e.id),
      isLoading: false,
      total: res.data['pagination']['total'],
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginationHelper<Notification>;
  }
}

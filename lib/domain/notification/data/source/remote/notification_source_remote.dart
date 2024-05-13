import 'package:dio/dio.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination_helper.dart';

class NotificationSourceRemote implements NotificationSource {
  @override
  Future<PaginationHelper<NotificationS>> loadNotifications(
      {required PaginationHelper<NotificationS> pagination}) async {
    Response res = await DioClient.simpleDio()
        .get(ApiKeys.notifications, queryParameters: pagination.toJson());

    print(' loadNotifications ............................ ');
    print(NotificationS.fromJson(res.data['data'][0]).toJson());
    int testcount = 0;

    List<NotificationS> notification =
        res.data['data'].map<NotificationS>((json) {
      print(++testcount);
      print(NotificationS.fromJson(json));
      return NotificationS.fromJson(json);
    }).toList();

    print(notification);

    return pagination.copyWith(
      data: [...pagination.data as List<NotificationS>, ...notification]
          .unique((e) => e.id),
      isLoading: false,
      total: res.data['pagination']['total'],
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginationHelper<NotificationS>;
  }
}

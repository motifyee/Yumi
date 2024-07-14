import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/core/setup/signalr.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/global.dart';

class NotificationSignalR {
  static listen() {
    Signalr.on(Signals.notification, (List<dynamic>? p0) {
      if (p0?.any((e) =>
              e['chef_ID'] == G().context.read<UserCubit>().state.user.id ||
              e['driver_ID'] == G().context.read<UserCubit>().state.user.id ||
              e['client_ID'] == G().context.read<UserCubit>().state.user.id) ??
          false) {
        G()
            .context
            .read<NotificationCubit>()
            .newNotification(NotificationS.fromJson(p0?[0]));
      }
    });
  }
}

// {"type":1,"target":"notification","arguments":[{"id":"b8e0cfc6-cfe3-4747-80bd-f831f60b5fd0","notificationType":1,"description":"New order received with id: 301002","type_ID":301002,"driver_ID":null,"chef_ID":"c2d02a9b-171b-4517-8e16-5ca0726f2bf5","client_ID":"102246b7-dcc2-46b9-ae01-3bd2b0b7d117","employee_ID":366,"branchId":48,"companyId":27,"type":1,"createdBy":"577f8a2d-0d08-4f63-a91a-d8b80f6efd69","updatedBy":null,"isActive":true,"isDeleted":false,"createDate":"2024-05-26T13:41:08.1058963+02:00","updateDate":null}]}'.

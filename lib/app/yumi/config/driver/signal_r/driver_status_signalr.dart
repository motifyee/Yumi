import 'package:dependencies/dependencies.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';

class DriverStatusSignalR {
  static listen() {
    Signalr.on(Signal.updatedriverstatus, (p0) {
      final int index = p0?.indexWhere(
            (e) =>
                G().context.read<UserCubit>().state.user.id == e['driver_ID'],
          ) ??
          -1;

      if (index <= -1) return;

      final userCubit = G().rd<UserCubit>();
      dynamic userWithStatus(int status) =>
          userCubit.state.user.copyWith(status: status);

      userCubit
          .saveUser(userWithStatus((p0![index] as dynamic)['status_Work']));
    });
  }
}

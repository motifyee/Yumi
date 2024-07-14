import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';

class ChefStatusSignalR {
  static listen() {
    Signalr.on(Signals.updatechefstatus, (p0) {
      int index = p0?.indexWhere((dynamic e) =>
              G().context.read<UserCubit>().state.user.id == e['chef_ID']) ??
          -1;

      if (index <= -1) return;

      final userCubit = G().rd<UserCubit>();
      dynamic userWithStatus(int status) =>
          userCubit.state.user.copyWith(status: status);

      userCubit.saveUser(userWithStatus((p0![index] as dynamic)['statusWork']));
    });
  }
}

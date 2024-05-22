import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';

class ChefStatusSignalR {
  static listen() {
    Signalr.on(Signals.updatechefstatus, (p0) {
      int index = p0?.indexWhere((dynamic e) =>
              G.context.read<UserBloc>().state.user.id == e['chef_ID']) ??
          -1;
      if (index > -1) {
        G.context.read<UserBloc>().add(UserFromJsonEvent(
            user: G.context
                .read<UserBloc>()
                .state
                .user
                .copyWith(status: (p0![index] as dynamic)['status_Work'])
                .toJson()));
      }
    });
  }
}

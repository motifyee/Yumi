import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/domain/signal_r/entity/signal_r.dart';
import 'package:yumi/global.dart';

class GeneralListenerSignalr {
  static listen() {
    List<Signal> list = [
      Signal.neworderreceived,
      Signal.chefaccept,
      Signal.driveraccept,
      Signal.chefstart,
      Signal.cheffinished,
      Signal.driverreceived,
      Signal.clientreceived,
      Signal.clientcancel,
      Signal.clientwait,
    ];

    for (var signal in list) {
      Signalr.on(signal, (List<dynamic>? p0) {
        if (p0?.any((e) =>
                e['chef_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['driver_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['client_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['buddiesId'] ==
                    G().context.read<UserCubit>().state.user.id) ??
            false || (signal == Signal.neworderreceived && G().isDriverApp)) {
          G()
              .context
              .read<SignalRCubit>()
              .addSignals(signal: SignalRM(type: signal, message: p0));
        }
      });
    }
  }
}

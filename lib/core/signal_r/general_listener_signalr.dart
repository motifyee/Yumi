import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/domain/signal_r/entity/signal_r.dart';
import 'package:yumi/global.dart';

class GeneralListenerSignalr {
  static listen() {
    List<Signals> list = [
      Signals.neworderreceived,
      Signals.chefaccept,
      Signals.driveraccept,
      Signals.chefstart,
      Signals.cheffinished,
      Signals.driverreceived,
      Signals.clientreceived,
      Signals.clientcancel,
      Signals.clientwait,
    ];

    for (var signal in list) {
      Signalr.on(signal, (List<dynamic>? p0) {
        if (p0?.any((e) =>
                e['chef_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['driver_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['client_ID'] == G().context.read<UserCubit>().state.user.id ||
                e['buddiesId'] ==
                    G().context.read<UserCubit>().state.user.id) ??
            false || (signal == Signals.neworderreceived && G().isDriverApp)) {
          G()
              .context
              .read<SignalRCubit>()
              .addSignals(signal: SignalRM(type: signal, message: p0));
        }
      });
    }
  }
}

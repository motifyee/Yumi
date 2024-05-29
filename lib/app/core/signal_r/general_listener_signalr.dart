import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/signal_r/entity/signal_r.dart';
import 'package:yumi/global.dart';

class GeneralListenerSignalr {
  static listen() {
    for (var signal in Signals.values) {
      Signalr.on(signal, (p0) {
        if (p0.any((e) =>
                e['chef_ID'] == G.context.read<UserBloc>().state.user.id ||
                e['driver_ID'] == G.context.read<UserBloc>().state.user.id ||
                e['client_ID'] == G.context.read<UserBloc>().state.user.id ||
                e['buddiesId'] == G.context.read<UserBloc>().state.user.id) ||
            (signal == Signals.neworderreceived && G.isDriverApp)) {
          G.context
              .read<SignalRCubit>()
              .addSignals(signal: SignalRM(type: signal, message: p0));
        }
      });
    }
  }
}

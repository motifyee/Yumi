import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/service/chef_service.dart';

class AfterReconnectSignalr {
  static reconnectedCall() async {
    print('AfterReconnectSignalr request  .............');
    if (G.isCustomerApp) return;
    await ChefService.getChefStatus(
            accountId: G.context.read<UserBloc>().state.user.id)
        .then((value) => G.context.read<UserBloc>().add(UserFromJsonEvent(
            user: G.context
                .read<UserBloc>()
                .state
                .user
                .copyWith(status: value.data['statusWork'])
                .toJson())));
  }
}

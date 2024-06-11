import 'package:yumi/bloc/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/service/chef_service.dart';

class AfterReconnectSignalr {
  static reconnectedCall() async {
    if (G.isCustomerApp) return;

    final userCubit = G.rd<UserCubit>();
    dynamic userWithStatus(int status) =>
        userCubit.state.user.copyWith(status: status).toJson();

    await ChefService.getChefStatus(accountId: userCubit.state.user.id).then(
      (value) => userCubit.saveUser(userWithStatus(value.data['statusWork'])),
    );

    // .then((value) => G.context.read<xUserBloc>().add(UserFromJsonEvent(
    //     user: G.context
    //         .read<xUserBloc>()
    //         .state
    //         .user
    //         .copyWith(status: value.data['statusWork'])
    //         .toJson())));
  }
}

import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/global.dart';

class AfterReconnectSignalr {
  static reconnectedCall([String? connectionId]) {
    print('AfterReconnectSignalr ......................');
    if (G().isCustomerApp) return;
    G().rd<UserCubit>().getStatus();
  }
}

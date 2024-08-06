import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/signalr.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  saveLocation(Address address) async {
    await LocalStorage.sharedRef.setValue(LocalStorage.userLocation, address);

    emit(state.copyWith(address: address));
  }

  Future<void> saveUser(User user) async {
    await LocalStorage.sharedRef.setValue(LocalStorage.user, user.toJson());

    emit(state.copyWith(user: user));
  }

  Future<User?> loadUser() async {
    Map<String, dynamic>? user =
        await LocalStorage.sharedRef.getValue(LocalStorage.user);
    Map<String, dynamic>? userLocation =
        await LocalStorage.sharedRef.getValue(LocalStorage.userLocation);

    if (user == null) return null;

    await saveUser(User.fromJson(user));

    saveLocation(Address.fromJson(userLocation ?? user));
    return User.fromJson(user);
  }

  updateStatus([UserStatus? userStatus]) async {
    if (state.loading) return;
    emit(state.copyWith(loading: true));

    int status = state.user.status == 1 ? 0 : 1;
    if (userStatus == UserStatus.offline) status = 0;
    if (userStatus == UserStatus.online) status = 1;
    if (userStatus == UserStatus.busy) status = 2;
    try {
      //* await UserStatusService.updateStatus(status: status);
      UpdateStatus().call(UpdateStatusParam(status));

      await LocalStorage.sharedRef
          .setValue(LocalStorage.user, state.user.copyWith(status: status));
      emit(state.copyWith(
        loading: false,
        user: state.user.copyWith(status: status),
      ));
    } catch (err) {
      emit(state.copyWith(
        loading: false,
      ));
    }
  }

  getStatus() async {
    dynamic userWithStatus(int status) => state.user.copyWith(status: status);

    final params = GetChefWorkStatusParams(state.user.id);
    await GetChefWorkStatus().call(params).then((res) => res.fold(
          (l) => print(l.toString()),
          (r) {
            saveUser(userWithStatus(r.index));
          },
        ));
  }

  Future<void> reset() async {
    await LocalStorage.sharedRef.removeValue(LocalStorage.user);
    await LocalStorage.sharedRef.removeValue(LocalStorage.token);
    await LocalStorage.sharedRef.removeValue(LocalStorage.userLocation);

    // TODO remove to relevant logic block
    Signalr.stopConnection();

    emit(const UserState());
  }
}

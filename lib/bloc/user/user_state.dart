part of 'user_bloc.dart';

@immutable
class xUserState extends Equatable {
  final UserModel user;
  final Address? address;
  final bool loading;

  const xUserState({
    required this.user,
    this.address,
    this.loading = false,
  });

  xUserState copyWith({
    UserModel? user,
    Address? address,
    bool? loading,
  }) {
    return xUserState(
      user: user ?? this.user,
      address: address ?? this.address,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [user, address, loading];
}

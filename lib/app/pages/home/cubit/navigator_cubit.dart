import 'package:dependencies/dependencies.dart';

part 'navigator_cubit.g.dart';

part 'navigator_cubit.freezed.dart';

@freezed
class NavigatorStates with _$NavigatorStates {
  const factory NavigatorStates({@Default(0) int selectedIndex}) =
      _NavigatorStates;

  factory NavigatorStates.fromJson(Map<String, dynamic> json) =>
      _$NavigatorStatesFromJson(json);
}

class NavigatorCubit extends Cubit<NavigatorStates> {
  NavigatorCubit() : super(const NavigatorStates());

  navigate({required int selectedIndex}) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}

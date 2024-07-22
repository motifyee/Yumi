import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigator_cubit.g.dart';

part 'navigator_cubit.freezed.dart';

@freezed
class NavigatorStates with _$NavigatorStates {
  const factory NavigatorStates({@Default(0) int selectedIndex}) = _NavigatorStates;

  factory NavigatorStates.fromJson(Map<String, dynamic> json) => _$NavigatorStatesFromJson(json);
}

class NavigatorCubit extends Cubit<NavigatorStates> {
  NavigatorCubit() : super(NavigatorStates());

  navigate({required int selectedIndex}) {
    emit(state.copyWith(selectedIndex: selectedIndex));
  }
}

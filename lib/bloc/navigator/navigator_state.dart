part of 'navigator_bloc.dart';

class NavigatesState extends Equatable {
  int selectedIndex = 0;

  NavigatesState({required this.selectedIndex});

  NavigatesState copyWith(int index) {
    return NavigatesState(selectedIndex: index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}

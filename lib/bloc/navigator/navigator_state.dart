part of 'navigator_bloc.dart';

class NavigatesState extends Equatable {
  final int selectedIndex;

  NavigatesState({required this.selectedIndex});

  NavigatesState copyWith({required int index}) {
    return NavigatesState(selectedIndex: index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}

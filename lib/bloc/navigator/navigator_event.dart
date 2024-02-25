part of 'navigator_bloc.dart';

@immutable
class NavigatorEvent {
  final int selectedIndex;

  NavigatorEvent({required this.selectedIndex});
}

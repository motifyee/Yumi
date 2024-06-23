part of 'chefs_list_bloc.dart';

@immutable
class ChefsListState extends Equatable {
  List<Chef> chefs;
  int chefsUpdated;
  Pager pager;

  ChefsListState({
    required this.chefs,
    required this.pager,
    this.chefsUpdated = 0,
  });

  ChefsListState copyWith({List<Chef>? chefs, Pager? pager}) {
    return ChefsListState(
        chefs: chefs ?? this.chefs,
        chefsUpdated: chefsUpdated + 1,
        pager: pager ?? this.pager);
  }

  @override
  List<Object?> get props => [chefs, chefsUpdated];
}

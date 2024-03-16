part of 'chefs_list_bloc.dart';

@immutable
class ChefsListState extends Equatable {
  List<ChefModel> chefs;
  int chefsLength;
  PaginationHelper paginationHelper;

  ChefsListState(
      {required this.chefs,
      required this.chefsLength,
      required this.paginationHelper});

  ChefsListState copyWith(
      {List<ChefModel>? chefs, PaginationHelper? paginationHelper}) {
    return ChefsListState(
        chefs: chefs ?? this.chefs,
        chefsLength: (chefs ?? this.chefs).length,
        paginationHelper: paginationHelper ?? this.paginationHelper);
  }

  @override
  List<Object?> get props => [chefs, chefsLength];
}

part of 'chefs_list_bloc.dart';

@immutable
class ChefsListState extends Equatable {
  List<ChefModel> chefs;
  int chefsUpdated;
  PaginationHelper paginationHelper;

  ChefsListState({
    required this.chefs,
    required this.paginationHelper,
    this.chefsUpdated = 0,
  });

  ChefsListState copyWith(
      {List<ChefModel>? chefs, PaginationHelper? paginationHelper}) {
    return ChefsListState(
        chefs: chefs ?? this.chefs,
        chefsUpdated: chefsUpdated + 1,
        paginationHelper: paginationHelper ?? this.paginationHelper);
  }

  @override
  List<Object?> get props => [chefs, chefsUpdated];
}

part of 'chefs_list_bloc.dart';

@immutable
class ChefsListState extends Equatable {
  List<Chef> chefs;
  int chefsUpdated;
  Pagination pagination;

  ChefsListState({
    required this.chefs,
    required this.pagination,
    this.chefsUpdated = 0,
  });

  ChefsListState copyWith({List<Chef>? chefs, Pagination? pagination}) {
    return ChefsListState(
        chefs: chefs ?? this.chefs,
        chefsUpdated: chefsUpdated + 1,
        pagination: pagination ?? this.pagination);
  }

  @override
  List<Object?> get props => [chefs, chefsUpdated];
}

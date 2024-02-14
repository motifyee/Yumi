part of 'news_bloc.dart';

@immutable
class NewsState extends Equatable {
  final int selectedList;

  NewsState({required this.selectedList});

  NewsState copyWith({required int selectedList}) {
    return NewsState(selectedList: selectedList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedList];
}

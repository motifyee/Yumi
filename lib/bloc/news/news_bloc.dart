import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState(selectedList: 1)) {
    on<NewsEvent>((event, emit) {
      emit(state.copyWith(selectedList: event.selectedList));
    });
  }
}

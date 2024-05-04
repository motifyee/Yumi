import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/service/review_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'reviews_bloc.freezed.dart';
part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(ReviewsState.initial()) {
    on<ReviewsEvent>((event, emit) {
      event.map(
        getAll: (evt) => _getAll(evt, emit),
        updateReviews: (evt) => emit(evt.reviewsState),
        resetReviews: (evt) => emit(ReviewsState.initial()),
      );
    });
  }

  _getAll(_getAllEvent event, Emitter<ReviewsState> emit) async {
    if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
        !state.paginationHelper.isLoading) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

      Response res = await ReviewService.getAllReviews(
        chefId: event.chefID,
        loginCustomer: event.isMyReviews,
        queryParameters: state.paginationHelper.toJson(),
      );

      List<ReviewModel> data = res.data['data']
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList();

      add(
        ReviewsEvent.updateReviews(
          reviewsState: state.copyWith(
            reviews: data,
            paginationHelper: state.paginationHelper.copyWith(
              pageNumber: res.data['pagination']['page'],
              lastPage: res.data['pagination']['pages'],
              total: res.data['pagination']['total'],
              isLoading: false,
            ),
          ),
        ),
      );
    }
  }
}

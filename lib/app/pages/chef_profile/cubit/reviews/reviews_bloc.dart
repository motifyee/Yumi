import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/profile/entities/review_model.dart';
import 'package:yumi/service/review_service.dart';
import 'package:yumi/statics/pager.dart';

part 'reviews_bloc.freezed.dart';
part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(const ReviewsState());

  getReviews({required String chefID, bool isMyReviews = false}) async {
    if (!state.pager.canRequest) return;

    emit(state.copyWith.pager(isLoading: true));

    Response res = await ReviewService.getAllReviews(
      chefId: chefID,
      loginCustomer: isMyReviews,
      queryParameters: state.pager.toJson(),
    );

    List<ReviewModel> data = res.data['data']
        .map<ReviewModel>((e) => ReviewModel.fromJson(e))
        .toList();

    emit(
      state.copyWith(
        reviews: data,
        pager: state.pager.copyWith(
          pageNumber: res.data['pagination']['page'],
          lastPage: res.data['pagination']['pages'],
          total: res.data['pagination']['total'],
          isLoading: false,
        ),
      ),
    );
  }

  resetReviews() {
    emit(const ReviewsState());
  }

  updateReviews(List<ReviewModel> reviews) {
    emit(state.copyWith(reviews: reviews));
  }
}

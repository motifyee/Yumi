import 'package:dependencies/dependencies.dart';

part 'page_view_cubit.g.dart';

part 'page_view_cubit.freezed.dart';

@freezed
class PageViewState with _$PageViewState {
  const factory PageViewState({@Default(0) int selectedList}) = _PageViewState;

  factory PageViewState.fromJson(Map<String, dynamic> json) =>
      _$PageViewStateFromJson(json);
}

class PageViewCubit extends Cubit<PageViewState> {
  PageViewCubit() : super(const PageViewState());

  updateSelect({required int selectedList}) {
    emit(state.copyWith(selectedList: selectedList));
  }
}

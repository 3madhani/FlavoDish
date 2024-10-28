import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/search/data/repo/search_repo.dart';

part 'searched_meals_state.dart';

class SearchedMealsCubit extends Cubit<SearchedMealsState> {
  SearchedMealsCubit(this.searchRepo) : super(SearchedMealsInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchedMeals({required final String query}) async {
    emit(SearchedMealsLoading());

    var result = await searchRepo.getSearchedMeals(query: query);

    result.fold((failure) {
      emit(
        SearchedMealsFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (meals) {
      emit(
        SearchedMealsSuccess(
          searchedMeals: meals,
        ),
      );
    });
  }
  void resetSearch() {
    emit(SearchedMealsInitial());
  }
}

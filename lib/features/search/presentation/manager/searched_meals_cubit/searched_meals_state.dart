part of 'searched_meals_cubit.dart';

sealed class SearchedMealsState extends Equatable {
  const SearchedMealsState();

  @override
  List<Object> get props => [];
}

final class SearchedMealsInitial extends SearchedMealsState {}

final class SearchedMealsLoading extends SearchedMealsState {}

final class SearchedMealsSuccess extends SearchedMealsState {
  final MealModel searchedMeals;

  const SearchedMealsSuccess({required this.searchedMeals});
}

final class SearchedMealsFailure extends SearchedMealsState {
  final String errMessage;

  const SearchedMealsFailure({required this.errMessage});
}

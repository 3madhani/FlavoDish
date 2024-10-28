part of 'dish_cuisine_type_meals_cubit.dart';

sealed class DishCuisineTypeMealsState extends Equatable {
  const DishCuisineTypeMealsState();

  @override
  List<Object> get props => [];
}

final class DishCuisineTypeMealsInitial extends DishCuisineTypeMealsState {}

final class DishCuisineTypeMealsLoading extends DishCuisineTypeMealsState {}

final class DishCuisineTypeMealsSuccess extends DishCuisineTypeMealsState {
  final MealModel meal;

  const DishCuisineTypeMealsSuccess({required this.meal});
}

final class DishCuisineTypeMealsFailure extends DishCuisineTypeMealsState {
  final String errMessage;
  const DishCuisineTypeMealsFailure({required this.errMessage});
}

part of 'meal_type_meals_cubit.dart';

sealed class MealTypeMealsState extends Equatable {
  const MealTypeMealsState();

  @override
  List<Object> get props => [];
}

final class MealTypeMealsInitial extends MealTypeMealsState {}

final class MealTypeMealsLoading extends MealTypeMealsState {}

final class MealTypeMealsSuccess extends MealTypeMealsState {
  final MealModel meal;

  const MealTypeMealsSuccess({required this.meal});
}

final class MealTypeMealsFailure extends MealTypeMealsState {
  final String errMessage;

  const MealTypeMealsFailure({required this.errMessage});
}

part of 'dish_type_meals_cubit.dart';

sealed class DishTypeMealsState extends Equatable {
  const DishTypeMealsState();

  @override
  List<Object> get props => [];
}

final class DishTypeMealsInitial extends DishTypeMealsState {}

final class DishTypeMealsLoading extends DishTypeMealsState {}

final class DishTypeMealsSuccess extends DishTypeMealsState {
  final MealModel meal;

  const DishTypeMealsSuccess({required this.meal});
}

final class DishTypeMealsFailure extends DishTypeMealsState {
  final String errMessage;

  const DishTypeMealsFailure({required this.errMessage});
}









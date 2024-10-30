import 'package:dartz/dartz.dart';
import 'package:flavodish/core/errors/failure.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';

abstract class MealsRepo {


  Future<Either<Failure, MealModel>> getMealsDependingOnDishType({
    required String dishType,
    required String? cuisineType,
  });
  Future<Either<Failure, MealModel>> getMealsDependingOnDishTypeAndCuisineType({
    required String? dishType,
    required String cuisineType,
    required String ?mealType,
  });
  Future<Either<Failure, MealModel>> getMealsDependingOnMealType({
    required String mealType,
    required String? cuisineType,
  });
}

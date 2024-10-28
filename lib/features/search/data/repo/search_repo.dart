import 'package:dartz/dartz.dart';
import 'package:flavodish/core/errors/failure.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, MealModel>> getSearchedMeals(
      {required final String query});
}

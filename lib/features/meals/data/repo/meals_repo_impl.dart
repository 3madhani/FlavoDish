import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flavodish/core/api/api_service.dart';
import 'package:flavodish/core/errors/failure.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo.dart';

class MealsRepoImpl implements MealsRepo {
  final ApiService apiService;

  MealsRepoImpl(
    this.apiService,
  );

  @override
  Future<Either<Failure, MealModel>> getMealsDependingOnDishType(
      {required String dishType}) async {
    try {
      var data = await apiService.get(endPoint: '&dishType=$dishType');
      MealModel mealModel = MealModel.fromJson(data);

      return right(mealModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MealModel>> getMealsDependingOnMealType(
      {required String mealType}) async {
    try {
      // Make sure to pass the correct mealType
      var data = await apiService.get(endPoint: '&mealType=$mealType');
      MealModel mealModel = MealModel.fromJson(data);
      

      return right(mealModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MealModel>>
      getMealsDependingOnDishTypeAndCuisineType(
          {required String dishType, required String cuisineType}) async {
    try {
      var data = await apiService.get(
          endPoint: '&dishType=$dishType&cuisineType=$cuisineType');
      MealModel mealModel = MealModel.fromJson(data);

      return right(mealModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}

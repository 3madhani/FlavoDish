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
      {required String dishType, String? cuisineType}) async {
    try {
      String endPoint;
      // Make sure to pass the correct mealType
      if (cuisineType != null) {
        endPoint = "&dishType=$dishType&cuisineType=$cuisineType";
      } else {
        endPoint = "&dishType=$dishType";
      }
      var data = await apiService.get(endPoint: endPoint);

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
      {required String mealType, String? cuisineType}) async {
    try {
      String endPoint;
      // Make sure to pass the correct mealType
      if (cuisineType != null) {
        endPoint = "&mealType=$mealType&cuisineType=$cuisineType";
      } else {
        endPoint = "&mealType=$mealType";
      }
      var data = await apiService.get(endPoint: endPoint);

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
  Future<Either<Failure, MealModel>> getMealsDependingOnDishTypeAndCuisineType(
      {String? dishType, required String cuisineType, String? mealType}) async {
    try {
      String endPoint;
      if (mealType != null) {
        endPoint = "&dishType=$dishType";
      } else {
        endPoint = "&mealType=$mealType";
      }
      var data =
          await apiService.get(endPoint: '&cuisineType=$cuisineType$endPoint');
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



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flavodish/core/api/api_service.dart';
import 'package:flavodish/core/errors/failure.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';

import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MealModel>> getSearchedMeals(
      {String? query}) async {
    try {
      var data = await apiService.get(
        endPoint: '&type=public&q=$query',
      );
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

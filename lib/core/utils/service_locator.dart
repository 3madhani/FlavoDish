import 'package:dio/dio.dart';
import 'package:flavodish/core/api/api_service.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo_impl.dart';
import 'package:flavodish/features/search/data/repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<MealsRepoImpl>(
    MealsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}

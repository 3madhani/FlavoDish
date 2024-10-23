import 'package:dio/dio.dart';
import 'package:flavodish/core/api/api_service.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(
  //     getIt.get<ApiService>(),
  //   ),
  // );
  // getIt.registerSingleton<SearchRepoImpl>(
  //   SearchRepoImpl(
  //     getIt.get<ApiService>(),
  //   ),
  // );
}

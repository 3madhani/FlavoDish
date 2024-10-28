import 'package:dio/dio.dart';

class ApiService {
  final _appId = "7595ced2";
  final _apiKey = "%20d1cee1ad10110c1175133e8cf486eb99";
  final _baseUrl = "https://api.edamam.com/api/recipes/v2?";
  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio
        .get("$_baseUrl&type=public&app_id=$_appId&app_key=$_apiKey$endPoint");
    print(response.data);
    return response.data;
  }
}

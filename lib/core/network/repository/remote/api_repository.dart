import 'package:dio/dio.dart';
import 'package:rawg_flutter/core/network/api/rest_client.dart';
import 'package:rawg_flutter/core/network/model/results.dart';

import '../repository.dart';

class ApiRepository implements Repository {
  Dio _dio;
  RestClient _restClient;

  ApiRepository() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }

  @override
  Future<Result> getGames() {
    return _restClient.getGames();
  }
}

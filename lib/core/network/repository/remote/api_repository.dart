import 'package:dio/dio.dart';
import 'package:rawg_flutter/core/network/api/rest_client.dart';
import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:rawg_flutter/core/network/model/results.dart';
import 'package:rawg_flutter/utils/logging_interceptor.dart';

import '../repository.dart';

class ApiRepository implements Repository {
  Dio _dio;
  RestClient _restClient;

  ApiRepository() {
    _dio = Dio();
    _dio.interceptors.add(LoggingInterceptors());
    _restClient = RestClient(_dio);
  }

  @override
  Future<Result> getGames() {
    return _restClient.getGames();
  }

  @override
  Future<Games> getDetailGames(int id) {
    return _restClient.getDetailGame(id);
  }

  @override
  Future<Result> getSuggestedGames(int id) {
    return _restClient.getSuggestedGames(id);
  }
}

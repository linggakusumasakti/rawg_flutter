import 'package:dio/dio.dart' hide Headers;
import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constant.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("games")
  Future<Result> getGames();
}

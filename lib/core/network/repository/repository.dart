import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:rawg_flutter/core/network/model/results.dart';

abstract class Repository {
  Future<Result> getGames();
  Future<Games> getDetailGames(int id);
  Future<Result> getSuggestedGames(int id);
}

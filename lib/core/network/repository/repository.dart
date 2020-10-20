import 'package:rawg_flutter/core/network/model/games.dart';

abstract class Repository {
  Future<Result> getGames();
}

import 'package:rawg_flutter/core/network/model/results.dart';

abstract class Repository {
  Future<Result> getGames();
}

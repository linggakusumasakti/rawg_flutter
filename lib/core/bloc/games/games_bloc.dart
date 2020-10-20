import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rawg_flutter/core/network/repository/repository.dart';

import 'bloc.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final Repository repository;

  GamesBloc({this.repository}) : super(InitialGames());

  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    if (event is LoadGames) {
      yield* _mapLoadGamesToState();
    }
  }

  Stream<GamesState> _mapLoadGamesToState() async* {
    try {
      yield GamesLoading();
      var games = await repository.getGames();
      if (games.results.isEmpty) {
        yield GamesNoData("Games Not Found");
      } else {
        yield GamesHasData(games);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield GamesNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield GamesNoInternetConnection();
      } else {
        yield GamesError(e.toString());
      }
    }
  }
}

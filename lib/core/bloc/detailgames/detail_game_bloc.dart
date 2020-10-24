import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rawg_flutter/core/network/repository/repository.dart';

import 'bloc.dart';

class DetailGameBloc extends Bloc<DetailGameEvent, DetailGameState> {
  final Repository repository;

  DetailGameBloc({this.repository}) : super(InitialDetailGame());

  @override
  Stream<DetailGameState> mapEventToState(
    DetailGameEvent event,
  ) async* {
    if (event is LoadDetailGame) {
      yield* _mapLoadDetailGameToState(event.id);
    }
  }

  Stream<DetailGameState> _mapLoadDetailGameToState(int id) async* {
    try {
      DetailGameLoading();
      var game = await repository.getDetailGames(id);
      if (game == null) {
        yield DetailGameNoData("Detail Game Not Found");
      } else {
        yield DetailGameHasData(game);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT ||
          e.type == DioErrorType.DEFAULT) {
        yield DetailGameNoInternetConnection();
      } else {
        DetailGameError(e.message);
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rawg_flutter/core/network/repository/repository.dart';

import 'bloc.dart';

class SuggestedGamesBloc
    extends Bloc<SuggestedGamesEvent, SuggestedGamesState> {
  final Repository repository;

  SuggestedGamesBloc({this.repository}) : super(SuggestedGamesInitial());

  @override
  Stream<SuggestedGamesState> mapEventToState(
    SuggestedGamesEvent event,
  ) async* {
    if (event is LoadSuggestedGame) yield* _mapLoadSuggestedGames(event.id);
  }

  Stream<SuggestedGamesState> _mapLoadSuggestedGames(int id) async* {
    try {
      SuggestedGameLoading();
      var game = await repository.getSuggestedGames(id);
      if (game.results.isEmpty)
        yield SuggestedGameNoData('Suggested Game not Found');
      else
        yield SuggestedGameHasData(game);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT ||
          e.type == DioErrorType.DEFAULT)
        yield SuggestedGameNoInternetConnection();
      else
        SuggestedGameError(e.message);
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:rawg_flutter/core/network/model/games.dart';

abstract class DetailGameState extends Equatable {
  const DetailGameState();

  @override
  List<Object> get props => [];
}

class InitialDetailGame extends DetailGameState {}

class DetailGameLoading extends DetailGameState {}

class DetailGameHasData extends DetailGameState {
  final Games games;

  const DetailGameHasData([this.games]);

  @override
  List<Object> get props => [games];
}

class DetailGameNoData extends DetailGameState {
  final String message;

  const DetailGameNoData([this.message]);

  @override
  List<Object> get props => [message];
}

class DetailGameNoInternetConnection extends DetailGameState {}

class DetailGameError extends DetailGameState {
  final String errorMessage;

  const DetailGameError([this.errorMessage]);

  @override
  List<Object> get props => [errorMessage];
}

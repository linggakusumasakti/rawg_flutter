import 'package:equatable/equatable.dart';
import 'package:rawg_flutter/core/network/model/results.dart';

abstract class SuggestedGamesState extends Equatable {
  const SuggestedGamesState();

  @override
  List<Object> get props => [];
}

class SuggestedGamesInitial extends SuggestedGamesState {}

class SuggestedGameLoading extends SuggestedGamesState {}

class SuggestedGameHasData extends SuggestedGamesState {
  final Result result;

  const SuggestedGameHasData([this.result]);

  @override
  List<Object> get props => [result];
}

class SuggestedGameNoData extends SuggestedGamesState {
  final String message;

  const SuggestedGameNoData([this.message]);

  @override
  List<Object> get props => [message];
}

class SuggestedGameNoInternetConnection extends SuggestedGamesState {}

class SuggestedGameError extends SuggestedGamesState {
  final String errorMessage;

  const SuggestedGameError([this.errorMessage]);

  @override
  List<Object> get props => [errorMessage];
}

import 'package:equatable/equatable.dart';

abstract class SuggestedGamesEvent extends Equatable {
  final int id;

  const SuggestedGamesEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadSuggestedGame extends SuggestedGamesEvent {
  LoadSuggestedGame(int id) : super(id);
}

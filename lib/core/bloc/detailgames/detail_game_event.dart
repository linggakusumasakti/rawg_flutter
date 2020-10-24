import 'package:equatable/equatable.dart';

abstract class DetailGameEvent extends Equatable {
  final int id;

  const DetailGameEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadDetailGame extends DetailGameEvent {
  LoadDetailGame(int id) : super(id);
}

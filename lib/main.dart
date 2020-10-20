import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_flutter/ui/home_screen.dart';

import 'core/bloc/games/games_bloc.dart';
import 'core/network/repository/games_repository.dart';

void main() {
  runApp(BlocProvider<GamesBloc>(
    create: (context) => GamesBloc(repository: GamesRepository()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

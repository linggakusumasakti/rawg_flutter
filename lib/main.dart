import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_flutter/core/bloc/detailgames/bloc.dart';
import 'package:rawg_flutter/ui/detail/detail_game_screen.dart';
import 'package:rawg_flutter/ui/home_screen.dart';

import 'core/bloc/games/games_bloc.dart';
import 'core/network/repository/games_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GamesBloc(repository: GamesRepository()),
        ),
        BlocProvider<DetailGameBloc>(
          create: (context) => DetailGameBloc(repository: GamesRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Games',
        theme: ThemeData.dark(),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          DetailGameScreen.routeName: (context) => DetailGameScreen()
        },
      ),
    );
  }
}

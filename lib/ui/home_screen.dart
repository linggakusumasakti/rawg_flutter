import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_flutter/core/bloc/games/bloc.dart';
import 'package:rawg_flutter/core/bloc/games/games_bloc.dart';
import 'package:rawg_flutter/core/bloc/games/games_state.dart';
import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:rawg_flutter/utils/widget/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<GamesBloc>().add(LoadGames());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Games'),
        ),
        body: BlocBuilder<GamesBloc, GamesState>(builder: (context, state) {
          if (state is GamesHasData) {
            return ListView.builder(
                itemCount: state.result.results.length,
                itemBuilder: (BuildContext context, int index) {
                  Games games = state.result.results[index];
                  return Card(
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl: games.backgroundImage,
                          ),
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Text(
                                  games.name,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          } else if (state is GamesLoading) {
            return LoadingIndicator();
          } else if (state is GamesNoData) {
            return Container(
              child: Center(
                child: Text(state.message),
              ),
            );
          } else if (state is GamesNoInternetConnection) {
            return Container(
              child: Center(
                child: Text('No Internet Connection'),
              ),
            );
          } else {
            return LoadingIndicator();
          }
        }));
  }
}
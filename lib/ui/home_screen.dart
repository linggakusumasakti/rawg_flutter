import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_flutter/core/bloc/games/bloc.dart';
import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:rawg_flutter/core/network/model/genres.dart';
import 'package:rawg_flutter/core/network/model/parent_platform.dart';
import 'package:rawg_flutter/ui/detail/detail_game_screen.dart';
import 'package:rawg_flutter/utils/common/screen_arguments.dart';
import 'package:rawg_flutter/utils/widget/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    context.bloc<GamesBloc>().add(LoadGames());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Games', style: TextStyle(fontFamily: 'Roboto-Bold'),),
        ),
        body: BlocBuilder<GamesBloc, GamesState>(builder: (context, state) {
          if (state is GamesHasData) {
            return ListView.builder(
                itemCount: state.result.results.length,
                itemBuilder: (BuildContext context, int index) {
                  Games games = state.result.results[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailGameScreen.routeName,
                          arguments: ScreenArguments(games));
                    },
                    child: Card(
                      color: Colors.grey.withOpacity(0.2),
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            child: CachedNetworkImage(
                              imageUrl: games.backgroundImage,
                            ),
                          )),
                          Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: games.parentPlatform.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          ParentPlatform parentPlatform =
                                              games.parentPlatform[index];
                                          return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 2),
                                              child: Image.asset(
                                                parentPlatform.platform
                                                    .getImage(),
                                                width: 15,
                                              ));
                                        }),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.green)),
                                    child: Text(
                                      games.metacritic.toString(),
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Bold',
                                          fontSize: 16,
                                          color: Colors.green),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                            margin:
                                EdgeInsets.only(bottom: 4, left: 16, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    games.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Roboto-Bold',
                                        fontSize: 20,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Release Date : ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                Text(games.getDate(),
                                    style: TextStyle(
                                      fontSize: 13,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            child: Divider(color: Colors.grey),
                          ),
                          Container(
                            height: 15,
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Genres : ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                ListView.builder(
                                    itemCount: games.genres.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Genres genres = games.genres[index];
                                      String name = genres.name + ",";
                                      if (index == games.genres.length - 1) {
                                        name = genres.name;
                                      }
                                      return Container(
                                        margin: EdgeInsets.all(1),
                                        child: Text(
                                          name,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 16, right: 16, top: 0, bottom: 8),
                            child: Divider(color: Colors.grey),
                          ),
                        ],
                      ),
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

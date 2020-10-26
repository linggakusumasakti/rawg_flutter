import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg_flutter/core/bloc/detailgames/bloc.dart';
import 'package:rawg_flutter/core/network/model/games.dart';
import 'package:rawg_flutter/core/network/model/parent_platform.dart';
import 'package:rawg_flutter/core/network/model/short_screenshots.dart';
import 'package:rawg_flutter/utils/common/screen_arguments.dart';
import 'package:rawg_flutter/utils/widget/expandable_text.dart';
import 'package:rawg_flutter/utils/widget/linear_progress.dart';
import 'package:rawg_flutter/utils/widget/loading_indicator.dart';

class DetailGameScreen extends StatelessWidget {
  static const routeName = "/detail_game";

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    context.bloc<DetailGameBloc>().add(LoadDetailGame(args.games.id));
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<DetailGameBloc, DetailGameState>(
            builder: (context, state) {
          if (state is DetailGameHasData) {
            Games games = state.games;
            String desc = games.parseHtmlString(games.description);
            return SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(args.games.backgroundImage))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.8)
                            ],
                            stops: [
                              0.0,
                              1.0
                            ])),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.topLeft,
                        child: SafeArea(
                            child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              child: Text(
                                args.games.getDate(),
                                style: TextStyle(
                                    fontFamily: 'Roboto-Thin',
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: args.games.parentPlatform.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    ParentPlatform parentPlatform =
                                        args.games.parentPlatform[index];
                                    return Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 2),
                                        child: Image.asset(
                                          parentPlatform.platform.getImage(),
                                          width: 15,
                                        ));
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(args.games.name,
                            style: TextStyle(
                              fontFamily: 'Roboto-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: args.games.shortScreenshots.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              ShortScreenShots shortScreenshots =
                                  args.games.shortScreenshots[index];
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            shortScreenshots.getImageView()),
                                  ));
                            }),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        alignment: Alignment.topLeft,
                        child: Text('Rating Bar',
                            style: TextStyle(
                                fontFamily: 'Roboto-Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: ListView.builder(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: MyAssetsBar(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        background: Colors.red,
                                        assetsLimit: 100.9,
                                        assets: args.games.ratings,
                                      )));
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.adjust_sharp,
                              color: Colors.green,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 4, right: 16, left: 4),
                              child: Text("Exceptional",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.adjust_sharp,
                              color: Colors.blue,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 4, right: 16, left: 4),
                              child: Text("Recommended",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.adjust_sharp,
                              color: Colors.orange,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 4, right: 16, left: 4),
                              child: Text("Meh",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.adjust_sharp,
                              color: Colors.red,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 4, right: 16, left: 4),
                              child: Text("Skip",
                                  style: TextStyle(
                                      fontFamily: 'Roboto-Bold',
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                        alignment: Alignment.topLeft,
                        child: Text('About',
                            style: TextStyle(
                                fontFamily: 'Roboto-Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: ExpandableText(
                            desc,
                            trimLines: 8,
                          ))
                    ],
                  )
                ],
              ),
            );
          } else if (state is DetailGameNoData) {
            return Text(state.message);
          } else if (state is DetailGameLoading) {
            return LoadingIndicator();
          } else if (state is DetailGameNoInternetConnection) {
            return Text("No Internet Connection");
          } else if (state is DetailGameError) {
            return Text(state.errorMessage);
          } else {
            return LoadingIndicator();
          }
        }));
  }
}

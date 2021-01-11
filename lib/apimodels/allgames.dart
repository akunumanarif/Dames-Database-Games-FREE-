import 'package:catatan/screens/detailPage/detail.dart';
import 'package:flutter/material.dart';
import 'package:catatan/services/service.dart';
import '../models/gamesList.dart';
import '../screens/customLoader/loader.dart';



class AllGames extends StatelessWidget {
  final GameApi apiManager = GameApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getApi(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

class MmorpgGames extends StatelessWidget {
  final GameApi apiManager = GameApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getMmorpg(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              color: Colors.black,
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

class ShooterGames extends StatelessWidget {
  final GameApi apiManager = GameApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getShooter(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              color: Colors.black,
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

class MmoGames extends StatelessWidget {
  final GameApi apiManager = GameApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getMmo(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              color: Colors.black,
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

class StrategyGames extends StatelessWidget {
  final GameApi apiManager = GameApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getstrategy(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              color: Colors.black,
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

class RacingGames extends StatelessWidget {
  final GameApi apiManager = GameApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiManager.getracing(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GameList>> snapshot) {
          if (snapshot.hasData) {
            List<GameList> gameData = snapshot.data;
            return GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                children: gameData
                    .map((GameList gamesList) => Card(
                          child: InkResponse(
                            child: Container(
                              color: Colors.black,
                              child: Hero(
                                  tag: gamesList.thumbnail,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        gamesList.thumbnail,
                                        fit: BoxFit.fill,
                                      ))),
                              height: 50,
                            ),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          gameList: gamesList,
                                        ))),
                          ),
                        ))
                    .toList());
          }
          return Center(child: CustomLoader());
        });
  }
}

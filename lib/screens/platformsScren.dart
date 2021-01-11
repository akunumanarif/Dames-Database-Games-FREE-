import 'package:catatan/models/gameByPlatforms.dart';
import 'package:catatan/screens/detailPage/detail.dart';
import 'package:catatan/services/platforms.dart';
import 'package:flutter/material.dart';

class GamesByAllPlatform extends StatelessWidget {
  final PlatformsApi platformsApi = PlatformsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: platformsApi.getGameByPlatforms(),
      builder: (BuildContext context,
          AsyncSnapshot<List<GameByPlatforms>> snapshot) {
        if (snapshot.hasData) {
          List<GameByPlatforms> platformlist = snapshot.data;
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
              children: platformlist
                  .map((GameByPlatforms listByPlatforms) => Card(
                        child: InkResponse(
                          child: Hero(
                            tag: listByPlatforms.thumbnail,
                            child: Container(
                              // width: 20,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listByPlatforms.thumbnail),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailFromPlatform(
                                      gameListPlat: listByPlatforms))),
                        ),
                      ))
                  .toList());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GamesByBrowserPlatform extends StatelessWidget {
  final PlatformsApi platformsApi = PlatformsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: platformsApi.getPlatformBrowser(),
      builder: (BuildContext context,
          AsyncSnapshot<List<GameByPlatforms>> snapshot) {
        if (snapshot.hasData) {
          List<GameByPlatforms> platformlist = snapshot.data;
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
              children: platformlist
                  .map((GameByPlatforms listByPlatforms) => Card(
                        child: InkResponse(
                          child: Hero(
                            tag: listByPlatforms.thumbnail,
                            child: Container(
                              // width: 20,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listByPlatforms.thumbnail),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailFromPlatform(
                                      gameListPlat: listByPlatforms))),
                        ),
                      ))
                  .toList());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GamesByPcPlatform extends StatelessWidget {
  final PlatformsApi platformsApi = PlatformsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: platformsApi.getPlatformPC(),
      builder: (BuildContext context,
          AsyncSnapshot<List<GameByPlatforms>> snapshot) {
        if (snapshot.hasData) {
          List<GameByPlatforms> platformlist = snapshot.data;
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
              children: platformlist
                  .map((GameByPlatforms listByPCPlatforms) => Card(
                        child: InkResponse(
                          child: Hero(
                            tag: listByPCPlatforms.thumbnail,
                            child: Container(
                              // width: 20,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listByPCPlatforms.thumbnail),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => DetailFromPlatform(
                                      gameListPlat: listByPCPlatforms))),
                        ),
                      ))
                  .toList());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

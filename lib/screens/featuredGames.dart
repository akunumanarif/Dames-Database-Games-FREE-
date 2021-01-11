import 'package:catatan/screens/detailPage/detail.dart';
import 'package:catatan/services/featured.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import '../models/gamesList.dart';
import '../services/service.dart';
import '../screens/customLoader/loader.dart';

class FeaturedGames extends StatelessWidget {
  final FeaturedApi featuredApi = FeaturedApi();
  final GameApi apiManager = GameApi();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: Text(
                    "Discover New",
                    style: GoogleFonts.oswald(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(120, 17, 10, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard())),
                      child: Text(
                        "See all",
                        style: GoogleFonts.oswald(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 8),
                  child: Text(
                    "This is just a text This is just a text",
                    style: GoogleFonts.roboto(
                        color: Colors.grey[400], fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: apiManager.getApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<GameList>> snapshot) {
                    if (snapshot.hasData) {
                      List<GameList> featuredList = snapshot.data;
                      return Container(
                        padding: EdgeInsets.only(bottom: 5),
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 120,
                              child: InkResponse(
                                child: Card(
                                  //color: Colors.white38,
                                  semanticContainer: true,
                                  child: Wrap(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Hero(
                                          tag: featuredList[index].thumbnail,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            height: 170,
                                            image: NetworkImage(
                                                featuredList[index].thumbnail),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        dense: true,
                                        isThreeLine: true,
                                        title: Text(
                                          featuredList[index].title,
                                          style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        subtitle: Text(
                                          featuredList[index].genre,
                                          style: GoogleFonts.oswald(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            gameList: featuredList[index]))),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(child: CustomLoader());
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

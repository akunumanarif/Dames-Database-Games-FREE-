import 'package:catatan/apimodels/allgames.dart';
import 'package:catatan/screens/dashboard.dart';
import 'package:catatan/screens/featuredGames.dart';
import 'package:catatan/screens/platformsScren.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            alasHome(context),
            Column(
              children: [
                Row(
                  children: [
                    searchBar(context),
                  ],
                ),
                Row(children: [
                  Expanded(child: boxPertama(context)),
                ]),
                boxKedua(context),
                cardTulisanTrending(context),
                boxTrending(context)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget alasHome(BuildContext context) {
  return Column(
    children: [
      Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Image(fit: BoxFit.cover, image: AssetImage('assets/pubg.jpg')),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget searchBar(BuildContext context) {
  return Container(
    // child: TextField(readOnly: true,
    //   decoration: InputDecoration(
    //       contentPadding: EdgeInsets.only(bottom: 12),
    //       icon: Padding(
    //         padding: const EdgeInsets.only(left: 8, right: 0),
    //         child: Icon(
    //           Icons.search,
    //           size: 18,
    //         ),
    //       ),
    //       // contentPadding: EdgeInsets.all(5),
    //       border: InputBorder.none,

    //       hintText: "Silahkan masukkan kata kunci",
    //       hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
    // ),
    decoration: BoxDecoration(color: Colors.transparent),
    margin: EdgeInsets.fromLTRB(45, 90, 0, 0),
    // color: Colors.green,
    width: MediaQuery.of(context).size.width / 1.29,
    height: MediaQuery.of(context).size.height / 19,
  );
}

Widget boxPertama(BuildContext context) {
  return Container(
    child: cardAtas(context),
    width: MediaQuery.of(context).size.width / 1.2,
    height: MediaQuery.of(context).size.height / 2.3,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(3.0, 0.0), //(x,y)
          blurRadius: 20.0,
        )
      ],
    ),
    margin: EdgeInsets.fromLTRB(45, 40, 0, 0),
  );
}

Widget cardAtas(BuildContext context) {
  return FeaturedGames();
}

Widget boxKedua(BuildContext context) {
  return Container(
    child: Column(
      children: [cardTulisanKategori(context), kategori(context)],
    ),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.25,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[100],
          offset: Offset(3.0, 0.0), //(x,y)
          blurRadius: 20.0,
        )
      ],
    ),
    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
  );
}

Widget cardTulisanKategori(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 45),
            child: Text(
              'Categories',
              style:
                  GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 140, top: 10),
              child: GestureDetector(
                child: Text(
                  'See all',
                  style: GoogleFonts.oswald(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Dashboard()),
                ),
              ))
        ],
      ),
    ],
  );
}

Widget kategori(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 20, 8, 5),
            child: GestureDetector(
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
                //color: Colors.red,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/mmorpg.png'),
                    ),
                    Text(
                      'MMORPG',
                      style: GoogleFonts.oswald(fontSize: 20),
                    ),
                    Text(
                      '4059 Games',
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MmorpgGames())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
            child: GestureDetector(
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
                //color: Colors.red,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/fps.jpg'),
                    ),
                    Text(
                      'Shooter',
                      style: GoogleFonts.oswald(fontSize: 20),
                    ),
                    Text(
                      '7349 Games',
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShooterGames())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
            child: GestureDetector(
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
                //color: Colors.red,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/mmo.png'),
                    ),
                    Text(
                      'MMO',
                      style: GoogleFonts.oswald(fontSize: 20),
                    ),
                    Text(
                      '4523 Games',
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MmoGames())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
            child: GestureDetector(
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
                //color: Colors.red,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/strategy.png'),
                    ),
                    Text(
                      'Strategy',
                      style: GoogleFonts.oswald(fontSize: 20),
                    ),
                    Text(
                      '6456 Games',
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StrategyGames())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
            child: GestureDetector(
              child: Container(
                width: 140,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
                //color: Colors.red,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/racing.jpg'),
                    ),
                    Text(
                      'Racing',
                      style: GoogleFonts.oswald(fontSize: 20),
                    ),
                    Text(
                      '1 M+ Games',
                      style: GoogleFonts.roboto(
                          fontSize: 10, fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RacingGames())),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cardTulisanTrending(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 45,
            ),
            child: Text(
              'Platforms',
              style:
                  GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150, top: 10),
            // child: Text(
            //   'See all',
            //   style:
            //       GoogleFonts.oswald(fontSize: 10, fontWeight: FontWeight.w400),
            // ),
          )
        ],
      ),
    ],
  );
}

Widget boxTrending(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(7, 8, 14, 5),
    child: Container(
      margin: EdgeInsets.only(left: 40),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: trendingTab(context),
    ),
  );
}

Widget trendingTab(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: TabBar(
              indicatorColor: Colors.grey[300],
              unselectedLabelColor: Colors.black26,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  text: 'Browser',
                ),
                Tab(
                  text: 'All Device',
                ),
                Tab(
                  text: 'PC',
                )
              ]),
        ),
        Expanded(
          child: Container(
            height: 120,
            child: TabBarView(
                dragStartBehavior: DragStartBehavior.start,
                children: [
                  GamesByBrowserPlatform(),
                  GamesByAllPlatform(),
                  GamesByPcPlatform()
                ]),
          ),
        )
      ],
    ),
  );
}

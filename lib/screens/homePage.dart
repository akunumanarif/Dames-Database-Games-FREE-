import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.pixelstalk.net%2Fwp-content%2Fuploads%2F2016%2F06%2FExcellent-Book-Wallpaper.jpg&f=1&nofb=1")),
      ),
      SizedBox(
        height: 10,
      ),
      // Expanded(
      //   child: Container(
      //     color: Colors.grey[300],
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height / 3,
      //   ),
      // )
    ],
  );
}

Widget searchBar(BuildContext context) {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 12),
          icon: Padding(
            padding: const EdgeInsets.only(left: 8, right: 0),
            child: Icon(
              Icons.search,
              size: 18,
            ),
          ),
          // contentPadding: EdgeInsets.all(5),
          border: InputBorder.none,
          hintText: "Silahkan masukkan kata kunci",
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
    ),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14)),
    margin: EdgeInsets.fromLTRB(45, 80, 0, 0),
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
                  child: Text(
                    "See all",
                    style: GoogleFonts.oswald(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
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
                  builder: (context, snapshot) {
                    var tampilkan = json.decode(snapshot.data.toString());
                    return Container(
                      padding: EdgeInsets.only(bottom: 5),
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tampilkan.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            child: Card(
                              //color: Colors.white38,
                              semanticContainer: true,
                              child: Wrap(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      tampilkan[index]['img'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    isThreeLine: true,
                                    title: Text(
                                      tampilkan[index]['title'],
                                      style: GoogleFonts.roboto(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey),
                                    ),
                                    subtitle: Text(
                                      tampilkan[index]['text'],
                                      style: GoogleFonts.oswald(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/featured.json')),
            ),
          ),
        ],
      ));
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
            child: Text(
              'See all',
              style:
                  GoogleFonts.oswald(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          )
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
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              //color: Colors.red,
              child: Column(
                children: [
                  IconButton(
                      iconSize: 35,
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.heartBroken),
                      onPressed: () {}),
                  Text(
                    'Romance',
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    '214 Books',
                    style: GoogleFonts.roboto(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
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
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              //color: Colors.red,
              child: Column(
                children: [
                  IconButton(
                      iconSize: 35,
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.mountain),
                      onPressed: () {}),
                  Text(
                    'Adventure',
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    '16 Books',
                    style: GoogleFonts.roboto(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
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
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              //color: Colors.red,
              child: Column(
                children: [
                  IconButton(
                      iconSize: 35,
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.skull),
                      onPressed: () {}),
                  Text(
                    'Horror',
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    '12 Books',
                    style: GoogleFonts.roboto(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
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
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              //color: Colors.red,
              child: Column(
                children: [
                  IconButton(
                      iconSize: 35,
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.laughBeam),
                      onPressed: () {}),
                  Text(
                    'Humor',
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    '110 Books',
                    style: GoogleFonts.roboto(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 5),
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
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              //color: Colors.red,
              child: Column(
                children: [
                  IconButton(
                      iconSize: 35,
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.flask),
                      onPressed: () {}),
                  Text(
                    'Science',
                    style: GoogleFonts.oswald(fontSize: 20),
                  ),
                  Text(
                    '45 Books',
                    style: GoogleFonts.roboto(
                        fontSize: 10, fontStyle: FontStyle.italic),
                  )
                ],
              ),
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
              'Trending',
              style:
                  GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 160, top: 10),
            child: Text(
              'See all',
              style:
                  GoogleFonts.oswald(fontSize: 10, fontWeight: FontWeight.w400),
            ),
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
                  text: 'Paid',
                ),
                Tab(
                  text: 'Exchange',
                ),
                Tab(
                  text: 'Free',
                )
              ]),
        ),
        Container(
          height: 120,
          child:
              TabBarView(dragStartBehavior: DragStartBehavior.start, children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Image.network(
                  'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-09/secrets.jpg?itok=zI_a7hBz'),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topCenter,
              child: Image.network(
                  'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-11/51PI4WpkcDL.jpg?itok=pOVe_C9M'),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topRight,
              child: Image.network(
                  'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-10/1_0.jpg?itok=8w-hx4Xt'),
            ),
          ]),
        )
      ],
    ),
  );
}

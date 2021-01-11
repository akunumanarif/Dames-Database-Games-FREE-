import 'package:catatan/models/gameByPlatforms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/gamesList.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final GameList gameList;
  DetailPage({this.gameList});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var iniUrl = widget.gameList.gameUrl;
    return Scaffold(
      appBar: AppBar(
        //title: Text('this is the tile'),
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  height: MediaQuery.of(context).size.height / 7,
                ),
                SafeArea(
                  left: true,
                  right: true,
                  top: false,
                  bottom: false,
                  minimum: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    //color: Colors.white,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 4.0), //(x,y)
                                  blurRadius: 10.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[100]),
                          child: Center(
                              child: Text(
                            widget.gameList.genre,
                            style: TextStyle(
                                fontSize: 10, color: Colors.green[600]),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.gameList.developer,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.gameList.title,
                          style: GoogleFonts.oswald(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TabBar(
                                      isScrollable: true,
                                      // indicatorSize:
                                      //     TabBarIndicatorSize.values[1],
                                      indicatorColor: Colors.green[300],
                                      // indicatorPadding:
                                      //     EdgeInsetsGeometry.infinity,
                                      labelColor: Colors.green,
                                      unselectedLabelColor: Colors.black,
                                      tabs: [
                                        Tab(
                                          text: 'About Game',
                                        ),
                                        Tab(
                                          text: 'Description',
                                        ),
                                      ]),
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      child: TabBarView(children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3.8,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.green[100],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 15,
                                                                      left: 20),
                                                              child: Column(
                                                                // textDirection:
                                                                //     TextDirection.ltr,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top:
                                                                            15),
                                                                    child: Text(
                                                                      'Platform',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top: 0),
                                                                    child:
                                                                        Container(
                                                                      //color: Colors.red,
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          140,
                                                                      child:
                                                                          Text(
                                                                        widget
                                                                            .gameList
                                                                            .platform,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                        maxLines:
                                                                            4,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Divider(
                                                        //   endIndent: 5,
                                                        // ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 15,
                                                                      left: 20),
                                                              child: Column(
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top:
                                                                            15),
                                                                    child: Text(
                                                                      'Publisher',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top: 0),
                                                                    child:
                                                                        Container(
                                                                      //color: Colors.amber,
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          140,
                                                                      child:
                                                                          Text(
                                                                        widget
                                                                            .gameList
                                                                            .publisher,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                        maxLines:
                                                                            4,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15,
                                                                  left: 0),
                                                          child: Column(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            140,
                                                                        top:
                                                                            5),
                                                                child: Text(
                                                                  'Release',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black26,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            130,
                                                                        top: 0),
                                                                child: Text(
                                                                  widget
                                                                      .gameList
                                                                      .releaseDate,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[100],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 30,
                                                                left: 70),
                                                        child: Column(
                                                          // textDirection:
                                                          //     TextDirection.ltr,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8,
                                                                      top: 15),
                                                              child: Text(
                                                                'Description',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black26,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8,
                                                                      top: 0),
                                                              child: Container(
                                                                width: 200,
                                                                height: 100,
                                                                child: Text(
                                                                  widget
                                                                      .gameList
                                                                      .shortDescription,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  maxLines: 4,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              height: MediaQuery.of(context).size.height / 6,
              width: 100,
              top: MediaQuery.of(context).size.height / 12,
              left: MediaQuery.of(context).size.width / 2.8,
              //right: 20,
              child: Container(
                child: Hero(
                    tag: widget.gameList.thumbnail,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.gameList.thumbnail,
                        fit: BoxFit.fill,
                      ),
                    )),
                width: 100,
                height: 100,
                // color: Colors.red,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 4.0), //(x,y)
                      blurRadius: 10.0,
                    )
                  ],
                  // borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   fit: BoxFit.fill,
                  //   image: NetworkImage(widget.gameList.thumbnail),
                  // )
                ),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 4.5,
              bottom: 10,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    child: Expanded(
                      child: Container(
                        child: Center(
                            child: Text(
                          'Go to Game Site',
                          style: GoogleFonts.oswald(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[700]),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _launched = _launchInBrowser(iniUrl);
                      });
                    },
                  ))),
        ],
      ),
    );
  }
}

class DetailFromPlatform extends StatefulWidget {
  final GameByPlatforms gameListPlat;
  DetailFromPlatform({this.gameListPlat});

  @override
  _DetailFromPlatformState createState() => _DetailFromPlatformState();
}

class _DetailFromPlatformState extends State<DetailFromPlatform> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var iniUrl = widget.gameListPlat.gameUrl;
    return Scaffold(
      appBar: AppBar(
        //title: Text('this is the tile'),
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  height: MediaQuery.of(context).size.height / 7,
                ),
                SafeArea(
                  left: true,
                  right: true,
                  top: false,
                  bottom: false,
                  minimum: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    //color: Colors.white,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 4.0), //(x,y)
                                  blurRadius: 10.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[100]),
                          child: Center(
                              child: Text(
                            widget.gameListPlat.genre,
                            style: TextStyle(
                                fontSize: 10, color: Colors.green[600]),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.gameListPlat.developer,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.gameListPlat.title,
                          style: GoogleFonts.oswald(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TabBar(
                                      isScrollable: true,
                                      indicatorColor: Colors.green[300],
                                      labelColor: Colors.green,
                                      unselectedLabelColor: Colors.black,
                                      tabs: [
                                        Tab(
                                          text: 'About Game',
                                        ),
                                        Tab(
                                          text: 'Description',
                                        ),
                                      ]),
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      child: TabBarView(children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3.8,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.green[100],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 15,
                                                                      left: 20),
                                                              child: Column(
                                                                // textDirection:
                                                                //     TextDirection.ltr,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top:
                                                                            15),
                                                                    child: Text(
                                                                      'Platform',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top: 0),
                                                                    child:
                                                                        Container(
                                                                      //color: Colors.red,
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          140,
                                                                      child:
                                                                          Text(
                                                                        widget
                                                                            .gameListPlat
                                                                            .platform,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                        maxLines:
                                                                            4,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Divider(
                                                        //   endIndent: 5,
                                                        // ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 15,
                                                                      left: 20),
                                                              child: Column(
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top:
                                                                            15),
                                                                    child: Text(
                                                                      'Publisher',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black26,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left: 8,
                                                                        top: 0),
                                                                    child:
                                                                        Container(
                                                                      //color: Colors.amber,
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          140,
                                                                      child:
                                                                          Text(
                                                                        widget
                                                                            .gameListPlat
                                                                            .publisher,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                        maxLines:
                                                                            4,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 15,
                                                                  left: 0),
                                                          child: Column(
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            140,
                                                                        top:
                                                                            5),
                                                                child: Text(
                                                                  'Release',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black26,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            130,
                                                                        top: 0),
                                                                child: Text(
                                                                  widget
                                                                      .gameListPlat
                                                                      .releaseDate,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[100],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 30,
                                                                left: 70),
                                                        child: Column(
                                                          // textDirection:
                                                          //     TextDirection.ltr,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8,
                                                                      top: 15),
                                                              child: Text(
                                                                'Description',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black26,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8,
                                                                      top: 0),
                                                              child: Container(
                                                                width: 200,
                                                                height: 100,
                                                                child: Text(
                                                                  widget
                                                                      .gameListPlat
                                                                      .shortDescription,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  maxLines: 4,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .clip,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              height: MediaQuery.of(context).size.height / 6,
              width: 100,
              top: MediaQuery.of(context).size.height / 12,
              left: MediaQuery.of(context).size.width / 2.8,
              //right: 20,
              child: Container(
                child: Hero(
                    tag: widget.gameListPlat.thumbnail,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.gameListPlat.thumbnail,
                        fit: BoxFit.fill,
                      ),
                    )),
                width: 100,
                height: 100,
                // color: Colors.red,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 4.0), //(x,y)
                      blurRadius: 10.0,
                    )
                  ],
                  // borderRadius: BorderRadius.circular(10),
                  // image: DecorationImage(
                  //   fit: BoxFit.fill,
                  //   image: NetworkImage(widget.gameList.thumbnail),
                  // )
                ),
              )),
          Positioned(
              left: MediaQuery.of(context).size.width / 4.5,
              bottom: 0,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    child: Expanded(
                      child: Container(
                        child: Center(
                            child: Text(
                          'Go to Game Site',
                          style: GoogleFonts.oswald(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[700]),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _launched = _launchInBrowser(iniUrl);
                      });
                    },
                  ))),
        ],
      ),
    );
  }
}

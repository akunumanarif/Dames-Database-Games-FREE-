import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          elevation: 0,
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.dehaze),
          //     onPressed: () {},
          //     color: Colors.black38,
          //   )
          // ],
          centerTitle: true,
          // title: Text(
          //   'Dashboard',
          //   style: GoogleFonts.oswald(color: Colors.black38),
          // ),
          backgroundColor: Colors.green[50],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Colors.black38,
          ),
        ),
        body: dashboardTab(context));
  }
}

Widget dashboardTab(BuildContext context) {
  final List<String> _listImage = [
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2305.jpg?itok=fKkqXRnW',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-2262.jpg?itok=uJn7UVVH',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1704.jpg?itok=5GwsfdUd',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-5719.jpg?itok=td4M8RUi',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1703.jpg?itok=xXV87Oq1',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1809.jpg?itok=axiOxxJb',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-8030.jpg?itok=E_O2T4si',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2305.jpg?itok=fKkqXRnW',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-2262.jpg?itok=uJn7UVVH',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1704.jpg?itok=5GwsfdUd',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-5719.jpg?itok=td4M8RUi',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1703.jpg?itok=xXV87Oq1',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1809.jpg?itok=axiOxxJb',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-8030.jpg?itok=E_O2T4si',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2305.jpg?itok=fKkqXRnW',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-2262.jpg?itok=uJn7UVVH',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1704.jpg?itok=5GwsfdUd',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-5719.jpg?itok=td4M8RUi',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1703.jpg?itok=xXV87Oq1',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1809.jpg?itok=axiOxxJb',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-8030.jpg?itok=E_O2T4si',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2305.jpg?itok=fKkqXRnW',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-2262.jpg?itok=uJn7UVVH',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1704.jpg?itok=5GwsfdUd',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-5719.jpg?itok=td4M8RUi',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1703.jpg?itok=xXV87Oq1',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-2310.jpg?itok=yI8ktlpk',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-orig-1809.jpg?itok=axiOxxJb',
    'https://manybooks.net/sites/default/files/styles/220x330sc/public/old-covers/cover-cust-8030.jpg?itok=E_O2T4si',
  ];

  return DefaultTabController(
    length: 6,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.green[50],
          child: TabBar(
              labelStyle: GoogleFonts.oswald(fontWeight: FontWeight.bold),
              isScrollable: true,
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.values[1],
              //indicatorSize: TabBarIndicatorSize.label,
              //indicatorPadding: EdgeInsets.only(left: 0, right: 0),
              indicatorWeight: 5,
              unselectedLabelColor: Colors.black26,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  text: 'Design',
                ),
                Tab(
                  text: 'Romance',
                ),
                Tab(
                  text: 'Horror',
                ),
                Tab(
                  text: 'Humor',
                ),
                Tab(
                  text: 'Adventure',
                ),
                Tab(
                  text: 'Science',
                )
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 15,
          color: Colors.green[50],
          //child: SizedBox(height: 15,),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(8)),
            ),
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 400,
            child: TabBarView(
                dragStartBehavior: DragStartBehavior.start,
                children: [
                  GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 5,
                        right: 5,
                      ),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 1,
                      children: _listImage
                          .map((buku) => Card(
                                child: Container(
                                  // width: 20,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(buku),
                                          fit: BoxFit.fill)),
                                ),
                              ))
                          .toList()),
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
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topRight,
                    child: Image.network(
                        'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-10/1_0.jpg?itok=8w-hx4Xt'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topRight,
                    child: Image.network(
                        'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-10/1_0.jpg?itok=8w-hx4Xt'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topRight,
                    child: Image.network(
                        'https://manybooks.net/sites/default/files/styles/220x330sc/public/2020-10/1_0.jpg?itok=8w-hx4Xt'),
                  ),
                ]),
          ),
        )
      ],
    ),
  );
}

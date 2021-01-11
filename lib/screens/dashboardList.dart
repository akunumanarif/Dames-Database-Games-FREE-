import 'package:catatan/apimodels/allgames.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import '../services/service.dart';

class IsiDashboard extends StatefulWidget {
  @override
  _IsiDashboardState createState() => _IsiDashboardState();
}

class _IsiDashboardState extends State<IsiDashboard> {
  final GameApi apiManager = GameApi();

  @override
  Widget build(BuildContext context) {
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
                    text: 'All Games',
                  ),
                  Tab(
                    text: 'MMORPG',
                  ),
                  Tab(
                    text: 'Shooter',
                  ),
                  Tab(
                    text: 'MMO',
                  ),
                  Tab(
                    text: 'Strategy',
                  ),
                  Tab(
                    text: 'Racing',
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
                    AllGames(),
                    MmorpgGames(),
                    ShooterGames(),
                    MmoGames(),
                    StrategyGames(),
                    RacingGames(),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:catatan/screens/searchfunction.dart';
import 'package:flutter/material.dart';
import '../screens/dashboardList.dart';

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
          centerTitle: true,
          backgroundColor: Colors.green[50],
          actions: [
            IconButton(
                icon: Icon(Icons.search_sharp, color: Colors.black),
                onPressed: () {
                  showSearch(context: context, delegate: SearchFunction());
                })
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black38,
          ),
        ),
        body: IsiDashboard());
  }
}

import 'package:catatan/screens/dashboard.dart';
import 'package:catatan/screens/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Homepage(),
        '/dashboard' : (context) => Dashboard()
      },
      debugShowCheckedModeBanner: false,
      // home: '/',
    );
  }
}
